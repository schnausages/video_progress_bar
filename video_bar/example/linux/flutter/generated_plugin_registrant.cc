//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <video_bar/video_bar_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) video_bar_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "VideoBarPlugin");
  video_bar_plugin_register_with_registrar(video_bar_registrar);
}
