package com.oamkprojects.security_control;

import android.app.PendingIntent;
import android.app.admin.DnsEvent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.webkit.HttpAuthHandler;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import androidx.work.Worker;
import androidx.work.WorkerParameters;
//import com.google.common.util.concurrent.Listenable

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Random;

import io.flutter.Log;

public class ServerSyncWorker extends Worker {
    private static final String CHANNEL_ID = "securitycontrolintruderalerts";
    private final String DEBUG_TAG = this.getClass().getSimpleName();

    private String updateIntervalKey = "flutter.updateinterval";
    private String serverAddressKey = "flutter.serveraddress";
    private String gopigokey = "flutter.gopigoexample";
//    private ArrayList msgList;

    public ServerSyncWorker(@NonNull Context context, @NonNull WorkerParameters workerParams) {
        super(context, workerParams);
    }

    @NonNull
    @Override
    public Result doWork() {
        Context applicationContext = getApplicationContext();
        NotificationManagerCompat notificationManager = NotificationManagerCompat.from(applicationContext);

        SharedPreferences prefs = applicationContext.getSharedPreferences("FlutterSharedPreferences",
                Context.MODE_PRIVATE);

        int battery;
        String serverAddress;
        serverAddress = prefs.getString(serverAddressKey, "195.148.21.106");
        Log.d(DEBUG_TAG, "Got server addr. from prefs:" + serverAddress);
        Random random = new Random();

        if (serverAddress.equals("")) {
            // Send notification?
            NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(applicationContext, CHANNEL_ID)
                    .setSmallIcon(R.mipmap.ic_launcher)
                    .setContentTitle("Could not sync with server")
                    .setContentText("Tap to open Security Control")
                    .setPriority(NotificationCompat.PRIORITY_HIGH);

            PendingIntent contentIntent = PendingIntent.getActivity(applicationContext, 0,
                    new Intent(applicationContext, MainActivity.class), PendingIntent.FLAG_UPDATE_CURRENT);

            mBuilder.setContentIntent(contentIntent);

            notificationManager.notify(123, mBuilder.build());



            return Result.retry();
        } else {
            // Sync.
            // Instantiate the RequestQueue.
            String getResponse;
            RequestQueue queue = Volley.newRequestQueue(applicationContext);
            String url = "http://" + serverAddress + "/api/devices/get/activemessages";

            // Request a string response from the provided URL.
            StringRequest stringRequest = new StringRequest(Request.Method.GET, url,
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            // Display the first 500 characters of the response string.
                            Log.d(DEBUG_TAG, "Response is: " + response.toString());
                            ArrayList msgList = jsonToMessageList(response.toString());
                            volleyComplete(msgList);
                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    // Add error notification here?
                    Log.d(DEBUG_TAG, "ERROR on GET message from server" + error.toString());
                }
            });

            // Add the request to the RequestQueue.
            queue.add(stringRequest);



            return Result.success();
        }
    }

    ArrayList jsonToMessageList(String msg){
        JSONArray jsonArray = new JSONArray();
        ArrayList msgArray = new ArrayList();

        try {
            jsonArray = new JSONArray(msg);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.length(); i++) {
                try {
                    msgArray.add(jsonArray.getString(i));
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
        return msgArray;
    }

    void volleyComplete(ArrayList msgList) {
        boolean sendNotification = false;
        boolean intruderAlert = false;

        Context applicationContext = getApplicationContext();
        NotificationManagerCompat notificationManager = NotificationManagerCompat.from(applicationContext);
        ArrayList oneMessageList = new ArrayList();
        ArrayList criticalActions = new ArrayList(); // Stores only errors and intruder

        String notificationContent = "";

        if (msgList != null) {
            Log.d(DEBUG_TAG, msgList.get(0).getClass().toString());

            for(int i = 0; i < msgList.size(); i++){
                oneMessageList = jsonToMessageList(msgList.get(i).toString());

                if(oneMessageList.get(1).equals("Error")){ // TODO: CHANGE Messagetype to server group's definition
                    sendNotification = true;
                    criticalActions.add(oneMessageList);
                }
                else if(oneMessageList.get(1).equals("Intruder")){
                    sendNotification = true;
                    criticalActions.add(oneMessageList);
                    intruderAlert = true;
                }
            }

            if(criticalActions.size() == 1){
                notificationContent = "Action required: " + criticalActions.get(1).toString();
            }
            else if(criticalActions.size() > 1){
                notificationContent = Integer.toString(criticalActions.size()) + " actions required";
            }

            if(intruderAlert == true){
                notificationContent = "INTRUDER ALERT";
            }

            if(sendNotification = true){
                NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(applicationContext, CHANNEL_ID)
                        .setSmallIcon(R.mipmap.ic_launcher)
                        .setContentTitle(notificationContent)
                        .setContentText("Tap to open Security Control")
                        .setPriority(NotificationCompat.PRIORITY_HIGH)
                        .setAutoCancel(true);
                PendingIntent contentIntent = PendingIntent.getActivity(applicationContext, 0,
                        new Intent(applicationContext, MainActivity.class), PendingIntent.FLAG_UPDATE_CURRENT);

                mBuilder.setContentIntent(contentIntent);

                notificationManager.notify(1234, mBuilder.build());
            }
        }
    }
}