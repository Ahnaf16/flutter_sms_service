import 'package:flutter_sms_service/src/models/sms_data.dart';
import 'package:flutter_sms_service/src/models/sms_send_result.dart';
import 'package:flutter_sms_service/src/models/subscription_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_sms_service_method_channel.dart';

abstract class FlutterSmsServicePlatform extends PlatformInterface {
  FlutterSmsServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSmsServicePlatform _instance = MethodChannelFlutterSmsService();

  static FlutterSmsServicePlatform get instance => _instance;

  static set instance(FlutterSmsServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return _instance.getPlatformVersion();
  }

  Future<SMSSendResult> sendSMS(
    SMSData data, {
    required SMSDeliveredCallback onSMSDelivered,
  }) async {
    return await _instance.sendSMS(
      data,
      onSMSDelivered: onSMSDelivered,
    );
  }

  Future<List<SubscriptionInfo>> getSubscriptions() {
    return _instance.getSubscriptions();
  }
}
