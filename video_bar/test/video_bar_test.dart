import 'package:flutter_test/flutter_test.dart';
import 'package:video_bar/video_bar.dart';
import 'package:video_bar/video_bar_platform_interface.dart';
import 'package:video_bar/video_bar_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVideoBarPlatform
    with MockPlatformInterfaceMixin
    implements VideoBarPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VideoBarPlatform initialPlatform = VideoBarPlatform.instance;

  test('$MethodChannelVideoBar is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVideoBar>());
  });

  test('getPlatformVersion', () async {
    VideoBar videoBarPlugin = VideoBar();
    MockVideoBarPlatform fakePlatform = MockVideoBarPlatform();
    VideoBarPlatform.instance = fakePlatform;

    expect(await videoBarPlugin.getPlatformVersion(), '42');
  });
}
