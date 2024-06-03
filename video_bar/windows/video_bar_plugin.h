#ifndef FLUTTER_PLUGIN_VIDEO_BAR_PLUGIN_H_
#define FLUTTER_PLUGIN_VIDEO_BAR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace video_bar {

class VideoBarPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  VideoBarPlugin();

  virtual ~VideoBarPlugin();

  // Disallow copy and assign.
  VideoBarPlugin(const VideoBarPlugin&) = delete;
  VideoBarPlugin& operator=(const VideoBarPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace video_bar

#endif  // FLUTTER_PLUGIN_VIDEO_BAR_PLUGIN_H_
