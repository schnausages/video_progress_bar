library video_progress_bar;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

/// A widget that provides a method of building widgets using an interpolated
/// position value for [VideoPlayerController].
class SmoothVideoProgress extends HookWidget {
  final VideoPlayerController videoController;

  /// The builder function.
  ///
  /// [progressDuration] marks the elapsed duration of the controller whereas
  /// [videoDuration] holds the total length of the video file to be played
  ///
  final Function(BuildContext context, Duration progressDuration,
      Duration videoDuration) barBuilder;
  const SmoothVideoProgress({
    Key? key,
    required this.barBuilder,
    required this.videoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VideoPlayerValue value = useValueListenable(videoController);
    final AnimationController animationController = useAnimationController(
        duration: value.duration, keys: [value.duration]);

    final double targetRelativePosition =
        value.position.inMilliseconds / value.duration.inMilliseconds;

    final Duration currentPosition = Duration(
        milliseconds:
            (animationController.value * value.duration.inMilliseconds)
                .round());

    final Duration offset = value.position - currentPosition;

    useValueChanged(
      value.position,
      (_, __) {
        final correct = value.isPlaying &&
            offset.inMilliseconds > -500 &&
            offset.inMilliseconds < -50;
        final correction = const Duration(milliseconds: 500) - offset;
        final targetPos =
            correct ? animationController.value : targetRelativePosition;
        final duration = correct ? value.duration + correction : value.duration;

        animationController.duration = duration;
        value.isPlaying
            ? animationController.forward(from: targetPos)
            : animationController.value = targetRelativePosition;
        return true;
      },
    );

    useValueChanged(
      value.isPlaying,
      (_, __) => value.isPlaying
          ? animationController.forward(from: targetRelativePosition)
          : animationController.stop(),
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final double millis =
            animationController.value * value.duration.inMilliseconds;
        return barBuilder(
          context,
          Duration(milliseconds: millis.round()),
          value.duration,
        );
      },
    );
  }
}
