
import 'video_bar_platform_interface.dart';

class VideoBar {
  Future<String?> getPlatformVersion() {
    return VideoBarPlatform.instance.getPlatformVersion();
  }
}
