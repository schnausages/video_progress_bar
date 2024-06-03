import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProgressSlider extends StatelessWidget {
  final Size screenSize;
  final Duration position;
  final Duration duration;
  final VideoPlayerController videoController;
  final Color colorSwatch;
  final double touchAreaSize;
  final Color activeBarColor;
  final Color inactiveBarColor;
  final Color thumbColor;
  const VideoProgressSlider({
    super.key,
    required this.screenSize,
    required this.position,
    required this.duration,
    required this.videoController,
    required this.colorSwatch,
    this.activeBarColor = Colors.white38,
    this.thumbColor = Colors.transparent,
    this.inactiveBarColor = Colors.white10,
    this.touchAreaSize = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final double max = duration.inMilliseconds.toDouble();
    final double value = position.inMilliseconds.clamp(0, max).toDouble();
    // value.toInt()

    return Theme(
        data: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: colorSwatch),
          useMaterial3: true,
        ),
        child: SliderTheme(
          data: SliderThemeData(
              thumbColor: thumbColor,
              thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: touchAreaSize)),
          child: Slider(
            min: 0,
            activeColor: activeBarColor,
            inactiveColor: inactiveBarColor,
            max: max,
            value: value,
            onChanged: (value) {
              videoController.seekTo(Duration(milliseconds: value.toInt()));
            },
            onChangeStart: (_) => videoController.pause(),
            onChangeEnd: (_) {
              videoController.play();
            },
          ),
        ));
  }
}
