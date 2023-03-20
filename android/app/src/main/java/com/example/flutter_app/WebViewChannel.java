package com.example.flutter_app;

import android.app.Activity;
import android.content.Intent;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.gsta.m2m.networkdetection.Detection;
import com.gsta.m2m.networkdetection.model.DetectionResult;
import com.gsta.m2m.networkdetection.util.DetectionMode;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class WebViewChannel implements MethodChannel.MethodCallHandler {

    public static final String CHANNEL = "open/webview";
    static MethodChannel channel;

    private Activity activity;

    private WebViewChannel(Activity activity){
        this.activity = activity;
    }

    public static void registerWith(FlutterEngine flutterEngine, FlutterActivity flutterActivity){
        channel = new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL);
        WebViewChannel instance = new WebViewChannel(flutterActivity);
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (call.method.equals("openWebView")){
            String urls = call.argument("urls");
            String title = call.argument("title");
            Intent intent = new Intent(this.activity, WebViewActivity.class);
            intent.putExtra("urls", urls);
            intent.putExtra("title", title);
            this.activity.startActivity(intent);
        }
    }
}

