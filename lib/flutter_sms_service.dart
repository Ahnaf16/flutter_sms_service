import 'package:flutter_sms_service/src/flutter_sms_service_method_channel.dart';
import 'package:flutter_sms_service/src/models/sms_data.dart';
import 'package:flutter_sms_service/src/models/sms_send_result.dart';
import 'package:flutter_sms_service/src/models/subscription_info.dart';

import 'src/flutter_sms_service_platform_interface.dart';

class FlutterSmsService {
  final _platform = FlutterSmsServicePlatform.instance;

  Future<String?> getPlatformVersion() {
    return _platform.getPlatformVersion();
  }

  Future<SMSSendResult> sendSMS({
    required String phoneNumber,
    required String message,
    required int slot,
    required SMSDeliveredCallback onSMSDelivered,
  }) {
    final smsData = SMSData(
      phoneNumber: phoneNumber,
      message: message,
      simSlot: slot,
    );
    return _platform.sendSMS(smsData, onSMSDelivered: onSMSDelivered);
  }

  Future<List<SubscriptionInfo>> getSimSubscriptionInfo() {
    return _platform.getSubscriptionInfo();
  }
}
