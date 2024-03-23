package com.marj.flutter_sms_service

import android.os.Build
import android.telephony.SubscriptionInfo

data class SubInfo(
    val slot: Int,
    val displayName: String,
    val carrierName: String,
    val networkCountryIso: String,
    val networkOperator: String?,
    val networkOperatorName: String?,
    val simCountryIso: String,
    val simOperator: String?,
    val simOperatorName: String?,
    val simSerialNumber: String,

) {
    companion object {
        fun fromSubscriptionInfo(subscriptionInfo: SubscriptionInfo,index: Int): SubInfo {
            return        SubInfo(
                    index,
                    subscriptionInfo.displayName.toString(),
                    subscriptionInfo.carrierName.toString(),
                    subscriptionInfo.countryIso,
                   if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.mccString.toString() else null,
                    if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.mncString.toString() else null,
                    subscriptionInfo.countryIso,
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.mccString.toString() else null,
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.mncString.toString() else null,
                    subscriptionInfo.subscriptionId.toString(),
                )
            }
        }

    // create a toMap

    fun toMap(): Map<String, Any?> {
        val map = mutableMapOf<String, Any?>()
        map["slot"] = slot
        map["displayName"] = displayName
        map["carrierName"] = carrierName
        map["networkCountryIso"] = networkCountryIso
        map["networkOperator"] = networkOperator
        map["networkOperatorName"] = networkOperatorName
        map["simCountryIso"] = simCountryIso
        map["simOperator"] = simOperator
        map["simOperatorName"] = simOperatorName
        map["simSerialNumber"] = simSerialNumber
        return map
    }

    }
