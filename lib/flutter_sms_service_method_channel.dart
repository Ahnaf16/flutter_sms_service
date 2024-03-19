import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_sms_service_platform_interface.dart';

/// An implementation of [FlutterSmsServicePlatform] that uses method channels.
class MethodChannelFlutterSmsService extends FlutterSmsServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_sms_service');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
