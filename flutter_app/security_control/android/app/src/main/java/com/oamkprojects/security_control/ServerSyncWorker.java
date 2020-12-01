package com.oamkprojects.security_control;

import android.content.Context;
import android.content.SharedPreferences;
import android.webkit.HttpAuthHandler;

import androidx.annotation.NonNull;
import androidx.work.Worker;
import androidx.work.WorkerParameters;
//import com.google.common.util.concurrent.Listenable

import java.util.Random;

import io.flutter.Log;

public class ServerSyncWorker extends Worker {
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
        SharedPreferences prefs  = applicationContext.getSharedPreferences("FlutterSharedPreferences",
                Context.MODE_PRIVATE);

        int battery;
        String serverAddress;
        serverAddress = prefs.getString(serverAddressKey,"");
        Log.d(DEBUG_TAG, "Got server addr. from prefs:" + serverAddress);
        Random random = new Random();

        if(serverAddress.equals("")){
            // Send notification?
        }
        else{
            // Sync.
            battery = random.nextInt();
            String string =
                    "{" +
                            "\"id\": \"unique\"," +
                            "\"battery\": " + Integer.toString(battery) + "," +
                            "\"location\": 1" +
                            "}";
            SharedPreferences.Editor editor = prefs.edit();
            editor.putString(gopigokey,string);
            editor.apply();
            Log.d(DEBUG_TAG,"Put something in gopigo pref." + prefs.getString(gopigokey, "empty"));
        }

        return Result.success();
    }
}
