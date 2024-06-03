import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'video_bar_platform_interface.dart';

/// An implementation of [VideoBarPlatform] that uses method channels.
class MethodChannelVideoBar extends VideoBarPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('video_bar');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
