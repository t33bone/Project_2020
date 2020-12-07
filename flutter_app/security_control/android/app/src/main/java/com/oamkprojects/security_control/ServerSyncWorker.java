package com.oamkprojects.security_control;

import android.content.Context;
import android.content.SharedPreferences;
import android.webkit.HttpAuthHandler;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import androidx.work.Worker;
import androidx.work.WorkerParameters;
//import com.google.common.util.concurrent.Listenable

import java.util.Random;

import io.flutter.Log;

public class ServerSyncWorker extends Worker {
    private static final String CHANNEL_ID = "securitycontrolintruderalerts";
    private final String DEBUG_TAG = this.getClass().getSimpleName();

    private String updateIntervalKey = "flutter.updateinterval";
    private String serverAddressKey = "flutter.serveraddress";
    private String gopigokey = "flutter.gopigoexample";

    public ServerSyncWorker(@NonNull Context context, @NonNull WorkerParameters workerParams) {
        super(context, workerParams);
    }

    @NonNull
    @Override
    public Result doWork(){
        Context applicationContext = getApplicationContext();
        NotificationManagerCompat notificationManager = NotificationManagerCompat.from(applicationContext);

        SharedPreferences prefs  = applicationContext.getSharedPreferences("FlutterSharedPreferences",
                Context.MODE_PRIVATE);

        int battery;
        String serverAddress;
        serverAddress = prefs.getString(serverAddressKey,"");
        Log.d(DEBUG_TAG, "Got server addr. from prefs:" + serverAddress);
        Random random = new Random();

        if(serverAddress.equals("")){
            // Send notification?
            NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(applicationContext, CHANNEL_ID)
                    .setSmallIcon(R.mipmap.ic_launcher)
                    .setContentTitle("Could not sync with server")
                    .setContentText("Tap to open server settings")
                    .setPriority(NotificationCompat.PRIORITY_HIGH);
            notificationManager.notify(123, mBuilder.build());
            return Result.retry();
        }
        else{
            // Sync.
            battery = random.nextInt(100);
            String string =
                    "{" +
                            "\"id\": \"unique\"," +
                            "\"battery\": " + Integer.toString(battery) + "," +
                            "\"location\": 1" +
                            "}";
            SharedPreferences.Editor editor = prefs.edit();
            editor.putString(gopigokey,string);
            editor.apply();
//            editor.putInt(updateIntervalKey, battery);
//            editor.apply();
            Log.d(DEBUG_TAG,"Put something in gopigo pref." + prefs.getString(gopigokey, "empty"));
            Log.d(DEBUG_TAG, "Changed update interval" + Integer.toString(prefs.getInt(updateIntervalKey, 0)));
            NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(applicationContext, CHANNEL_ID)
                    .setSmallIcon(R.mipmap.ic_launcher)
                    .setContentTitle("We just did something")
                    .setContentText("Tap to do something more")
                    .setPriority(NotificationCompat.PRIORITY_HIGH)
                    .setAutoCancel(true);


            notificationManager.notify(1234, mBuilder.build());
            return Result.success();
        }

    }
}
