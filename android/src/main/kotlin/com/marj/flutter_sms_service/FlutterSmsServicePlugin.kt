package com.marj.flutter_sms_service

import android.telephony.SubscriptionInfo
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.Manifest
import android.app.Activity
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.telephony.SmsManager
import android.telephony.SubscriptionManager
import android.view.WindowManager
import androidx.core.app.ActivityCompat.checkSelfPermission
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import java.io.IOException


/** FlutterSmsServicePlugin */
class FlutterSmsServicePlugin : FlutterPlugin {

    private lateinit var channel: MethodChannel

    //    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    //        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_sms_service")
    //        channel.setMethodCallHandler(this)
    //    }
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        setupMethodChannel(binding.binaryMessenger, binding.applicationContext)
    }


//    override fun onMethodCall(call: MethodCall, result: Result) {
//        if (call.method == "getPlatformVersion") {
//            result.success("Android ${android.os.Build.VERSION.RELEASE}")
//        } else {
//            result.notImplemented()
//        }
//    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun setupMethodChannel(messenger: BinaryMessenger, context: Context) {
        channel = MethodChannel(messenger, "flutter_sms_service")


        val subscriptionManager: SubscriptionManager =
            context.getSystemService<SubscriptionManager>(SubscriptionManager::class.java)

        val handler = MethodCallHandlerImpl(subscriptionManager,context)
        channel.setMethodCallHandler(handler)
    }
}
