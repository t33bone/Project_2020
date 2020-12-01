package com.oamkprojects.security_control;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import androidx.work.ExistingPeriodicWorkPolicy;
import androidx.work.PeriodicWorkRequest;
import androidx.work.WorkManager;

import java.util.concurrent.TimeUnit;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity  extends FlutterActivity {

    private Intent serverSyncServiceIntent;
    private WorkManager workManager;
    private PeriodicWorkRequest serverSyncWorkRequest;
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        //GeneratedPluginRegistrant.registerWith(this);
        serverSyncWorkRequest = new PeriodicWorkRequest.Builder(ServerSyncWorker.class,
                PeriodicWorkRequest.MIN_PERIODIC_INTERVAL_MILLIS,
                TimeUnit.MILLISECONDS).build();

        serverSyncServiceIntent = new Intent(MainActivity.this, ServerSyncService.class);
        workManager = WorkManager.getInstance(this);
        workManager.enqueueUniquePeriodicWork("serverSyncWorker",
                ExistingPeriodicWorkPolicy.REPLACE,
                serverSyncWorkRequest);

        if((Build.VERSION.SDK_INT) >= (Build.VERSION_CODES.O)){
            //(serverSyncServiceIntent);

        } else{
            //startService(serverSyncServiceIntent);
        }


    }
}