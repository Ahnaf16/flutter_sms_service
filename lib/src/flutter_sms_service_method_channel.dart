import 'package:flutter/services.dart';
import 'package:flutter_sms_service/src/models/sms_data.dart';
import 'package:flutter_sms_service/src/models/sms_send_result.dart';
import 'package:flutter_sms_service/src/models/subscription_info.dart';

import 'flutter_sms_service_platform_interface.dart';

typedef SMSDeliveredCallback = Future<void> Function(SMSSendResult? result);

class MethodChannelFlutterSmsService extends FlutterSmsServicePlatform {
  final channel = const MethodChannel('flutter_sms_service');
  final _receiverChannel = const MethodChannel('smsResultReceiver');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<SMSSendResult> sendSMS(
    SMSData data, {
    required SMSDeliveredCallback onSMSDelivered,
  }) async {
    _receiveDeliveryResult(onSMSDelivered);

    final res = await channel.invokeMethod<SMSSendResult?>(
      'sendSMS',
      data.toMap(),
    );

    return res ?? SMSSendResult.defError(data.simSlot);
  }

  void _receiveDeliveryResult(SMSDeliveredCallback onSMSDelivered) {
    _receiverChannel.setMethodCallHandler(
      (call) async {
        if (call.method == 'result') {
          final result = SMSSendResult.fromMap(call.arguments);
          onSMSDelivered(result);
        }
      },
    );
  }

  @override
  Future<List<SubscriptionInfo>> getSubscriptions() async {
    final result =
        await channel.invokeMethod<List>('getSubscriptionInfo') ?? [];

    final subs = result.map((e) => SubscriptionInfo.fromMap(e)).toList();

    return subs;
  }
}
