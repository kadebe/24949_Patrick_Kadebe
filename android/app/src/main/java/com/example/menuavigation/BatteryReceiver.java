package com.example.yourapp.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.BatteryManager;
import android.widget.Toast;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

public class BatteryReceiver extends BroadcastReceiver {

    private static final int BATTERY_THRESHOLD = 90;
    private static final String CHANNEL_ID = "battery_channel";

    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction() != null && intent.getAction().equals(Intent.ACTION_BATTERY_CHANGED)) {
            int level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
            int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);

            if (level != -1 && scale != -1) {
                int batteryPct = (int) ((level / (float) scale) * 100);
                boolean isCharging = intent.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1) != 0;

                if (batteryPct >= BATTERY_THRESHOLD && isCharging) {
                    Toast.makeText(context, "Battery has reached " + BATTERY_THRESHOLD + "%", Toast.LENGTH_LONG).show();
                    showNotification(context, batteryPct);
                }
            }
        }
    }

    private void showNotification(Context context, int batteryPct) {
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context, CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_battery)
                .setContentTitle("Battery Status")
                .setContentText("Battery has reached " + batteryPct + "%")
                .setPriority(NotificationCompat.PRIORITY_HIGH);

        NotificationManagerCompat notificationManager = NotificationManagerCompat.from(context);
        notificationManager.notify(1, builder.build());
    }
}
