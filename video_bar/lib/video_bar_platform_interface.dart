import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'video_bar_method_channel.dart';

abstract class VideoBarPlatform extends PlatformInterface {
  /// Constructs a VideoBarPlatform.
  VideoBarPlatform() : super(token: _token);

  static final Object _token = Object();

  static VideoBarPlatform _instance = MethodChannelVideoBar();

  /// The default instance of [VideoBarPlatform] to use.
  ///
  /// Defaults to [MethodChannelVideoBar].
  static VideoBarPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VideoBarPlatform] when
  /// they register themselves.
  static set instance(VideoBarPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
