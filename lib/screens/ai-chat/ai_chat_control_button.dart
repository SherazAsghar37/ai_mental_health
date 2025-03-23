import 'package:ai_mental_health/utils/assets.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/app_rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';

class AiChatControlButton extends StatelessWidget {
  final VideoPlayerController controller;
  const AiChatControlButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppRoundedIconButton(
          source:
              controller.value.isPlaying ? Assets.pauseIcon : Assets.playIcon,
          onPressed: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
          backgroundColor: Colours.borderColor.withValues(alpha: 0.1),
        )
        .animate(delay: Duration(milliseconds: 1000))
        .fadeIn(
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        )
        .scale(
          begin: Offset(2, 2),
          end: Offset(1, 1),
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        );
  }
}
