package com.oamkprojects.security_control;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import androidx.work.ExistingPeriodicWorkPolicy;
import androidx.work.PeriodicWorkRequest;
import androidx.work.WorkManager;

import java.util.concurrent.TimeUnit;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity  extends FlutterActivity {

//    private Intent serverSyncServiceIntent;
    private WorkManager workManager;
    private PeriodicWorkRequest serverSyncWorkRequest;
    public final String CHANNEL_ID = "securitycontrolintruderalerts";

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        //GeneratedPluginRegistrant.registerWith(this);
        createNotificationChannel();

        NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(this, CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_android_black_24dp)
                .setContentTitle("TestApp")
                .setContentText("Code executed")
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setAutoCancel(true);

//        NotificationManagerCompat notificationManager = NotificationManagerCompat.from(this);
//        NotificationManager notificationManager = getSystemService(NotificationManager.class);
//        notificationManager.notify(5678, mBuilder.build());

        serverSyncWorkRequest = new PeriodicWorkRequest.Builder(ServerSyncWorker.class,
                PeriodicWorkRequest.MIN_PERIODIC_INTERVAL_MILLIS,
                TimeUnit.MILLISECONDS).build();

        //serverSyncServiceIntent = new Intent(MainActivity.this, ServerSyncService.class);
        workManager = WorkManager.getInstance(this);
        workManager.enqueueUniquePeriodicWork("serverSyncWorker",
                ExistingPeriodicWorkPolicy.REPLACE, // TODO: replace with KEEP in final version
                serverSyncWorkRequest);

        if((Build.VERSION.SDK_INT) >= (Build.VERSION_CODES.O)){
            //(serverSyncServiceIntent);

        } else{
            //startService(serverSyncServiceIntent);
        }

    }

    private void createNotificationChannel() {
        // Create the NotificationChannel, but only on API 26+ because
        // the NotificationChannel class is new and not in the support library
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            CharSequence name = getString(R.string.channel_name);
            String description = getString(R.string.channel_description);
            int importance = NotificationManager.IMPORTANCE_HIGH;
            NotificationChannel channel = new NotificationChannel(CHANNEL_ID, name, importance);
            channel.setDescription(description);
            // Register the channel with the system; you can't change the importance
            // or other notification behaviors after this
            NotificationManager notificationManager = getSystemService(NotificationManager.class);
            notificationManager.createNotificationChannel(channel);
        }



    }

}

