package com.marj.flutter_sms_service

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.telephony.SubscriptionInfo
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
            "getSubscriptionList" -> {

            }

            else -> result.notImplemented()

        }
    }

    private fun getSubscriptionInfoLis(): List<SubInfo> {

        val selfPermission: Int =
            ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_PHONE_STATE)

        val permissionGranted: Boolean = selfPermission == PackageManager.PERMISSION_GRANTED

        if (!permissionGranted) {
            return listOf<SubInfo>()
        }

        val list=  subscriptionManager.activeSubscriptionInfoList

    return    list.map { SubInfo.fromSubscriptionInfo(it,0) };
    }

}