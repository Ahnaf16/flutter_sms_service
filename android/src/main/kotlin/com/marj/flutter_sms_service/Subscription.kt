package com.marj.flutter_sms_service

import android.graphics.Bitmap
import android.os.Build
import android.telephony.SubscriptionInfo

data class Subscription(
    val slot: Int,
    val displayName: String,
    val carrierName: String,
    val countryIso: String,
    val carrierId: Int?,
    val mobileCountryCode: String?,
    val mobileNetworkCode: String?,
    val subscriptionId: Int,
    val cardId: Int?,
    val isEmbedded: Boolean?,
    val portIndex: Int?,
    val simSlotIndex: Int,
    val subscriptionType: Int?,
    val number: String?,

    ) {
    companion object {
        fun fromSubscriptionInfo(subscriptionInfo: SubscriptionInfo, index: Int): Subscription {
            return Subscription(
                index,
                subscriptionInfo.displayName.toString(),
                subscriptionInfo.carrierName.toString(),
                subscriptionInfo.countryIso,
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.carrierId else null,
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.mccString else null,
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.mncString else null,
                subscriptionInfo.subscriptionId,
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.cardId else null,
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) subscriptionInfo.isEmbedded else null,
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) subscriptionInfo.portIndex else null,
                subscriptionInfo.simSlotIndex,
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) subscriptionInfo.subscriptionType else null,
                subscriptionInfo.number,

             )
        }
    }


    fun toMap(): Map<String, Any?> {
        val map = mutableMapOf<String, Any?>()

        map["slot"] = slot
        map["displayName"] = displayName
        map["carrierName"] = carrierName
        map["carrierId"] = carrierId
        map["countryIso"] = countryIso
        map["mobileCountryCode"] = mobileCountryCode
        map["mobileNetworkCode"] = mobileNetworkCode
        map["subscriptionId"] = subscriptionId
        map["cardId"] = cardId
        map["isEmbedded"] = isEmbedded
        map["portIndex"] = portIndex
        map["simSlotIndex"] = simSlotIndex
        map["subscriptionType"] = subscriptionType
        map["number"] = number
        return map
    }

}
