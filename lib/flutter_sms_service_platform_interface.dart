import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_sms_service_method_channel.dart';

abstract class FlutterSmsServicePlatform extends PlatformInterface {
  /// Constructs a FlutterSmsServicePlatform.
  FlutterSmsServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSmsServicePlatform _instance = MethodChannelFlutterSmsService();

  /// The default instance of [FlutterSmsServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSmsService].
  static FlutterSmsServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSmsServicePlatform] when
  /// they register themselves.
  static set instance(FlutterSmsServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
