#include "include/video_bar/video_bar_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "video_bar_plugin.h"

void VideoBarPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  video_bar::VideoBarPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
