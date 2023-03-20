package com.example.flutter_app;

import android.app.Activity;
import android.widget.Toast;

import com.gsta.m2m.networkdetection.Detection;
import com.gsta.m2m.networkdetection.model.DetectionResult;
import com.gsta.m2m.networkdetection.util.DetectionMode;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class VpnChannel implements MethodChannel.MethodCallHandler {

    public static final String CHANNEL = "vpn/run";
    static MethodChannel channel;

    private Activity activity;

    private VpnChannel(Activity activity){
        this.activity = activity;
    }

    public static void registerWith(FlutterEngine flutterEngine, FlutterActivity flutterActivity){
        channel = new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL);
        VpnChannel instance = new VpnChannel(flutterActivity);
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
      if (call.method.equals("connection")){
            String publicIp = call.argument("publicIp");
            String privateIp = call.argument("privateIp");
            String name = call.argument("name");
            String token = call.argument("token");
            connection(publicIp, privateIp, name, token, result);
        }
    }

    private void connection(String publicIp, String privateIp, String name, String token, MethodChannel.Result chanelResult){
        new Thread(new Runnable() {
            @Override
            public void run() {
                activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(activity, "开始connect", Toast.LENGTH_SHORT).show();
                    }
                });
                Detection detection = new Detection();
                try{
                DetectionResult detectionResult = detection.detect(publicIp, privateIp, name, token, DetectionMode.PERSISTENT);
                activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(activity, "connect：" + detectionResult.toString(), Toast.LENGTH_SHORT).show();
                    }
                });

                }catch (Exception e){
                    chanelResult.success("error:"+e.getMessage());
                }
            }
        }).start();
    }
}
