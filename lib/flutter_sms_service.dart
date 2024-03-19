
import 'flutter_sms_service_platform_interface.dart';

class FlutterSmsService {
  Future<String?> getPlatformVersion() {
    return FlutterSmsServicePlatform.instance.getPlatformVersion();
  }
}
