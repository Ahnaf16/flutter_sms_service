import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sms_service/flutter_sms_service.dart';
import 'package:flutter_sms_service/flutter_sms_service_platform_interface.dart';
import 'package:flutter_sms_service/flutter_sms_service_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSmsServicePlatform
    with MockPlatformInterfaceMixin
    implements FlutterSmsServicePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSmsServicePlatform initialPlatform = FlutterSmsServicePlatform.instance;

  test('$MethodChannelFlutterSmsService is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSmsService>());
  });

  test('getPlatformVersion', () async {
    FlutterSmsService flutterSmsServicePlugin = FlutterSmsService();
    MockFlutterSmsServicePlatform fakePlatform = MockFlutterSmsServicePlatform();
    FlutterSmsServicePlatform.instance = fakePlatform;

    expect(await flutterSmsServicePlugin.getPlatformVersion(), '42');
  });
}
