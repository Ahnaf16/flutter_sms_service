package com.marj.flutter_sms_service

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.telephony.SubscriptionManager
import androidx.core.app.ActivityCompat
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

    internal class MethodCallHandlerImpl(
    private val subscriptionManager: SubscriptionManager,
    private val context: Context
) : MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
            "getSubscriptionInfo" -> {
               val list =  getSubscriptionInfoLis()

                result.success(list.map { it.toMap() })
            }

            else -> result.notImplemented()

        }
    }

    private fun getSubscriptionInfoLis(): List<Subscription> {

        val selfPermission: Int =
            ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_PHONE_STATE)

        val permissionGranted: Boolean = selfPermission == PackageManager.PERMISSION_GRANTED

        if (!permissionGranted) return listOf<Subscription>()

        val list = subscriptionManager.activeSubscriptionInfoList

        return list.map { Subscription.fromSubscriptionInfo(it, list.indexOf(it)) };
    }

}

