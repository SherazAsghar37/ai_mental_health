import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/arc_painter.dart';
import 'package:ai_mental_health/widgets/emoji.dart';
import 'package:flutter/material.dart';

class SadEmoji extends StatelessWidget {
  const SadEmoji({super.key});

  @override
  Widget build(BuildContext context) {
    return Emoji(
      color: Colours.purpleColor,
      mouth: Positioned(
        bottom: 14,
        left: 10,
        child: Transform.flip(
          flipY: true,
          child: SizedBox(
            height: 12,
            width: 40,
            child: CustomPaint(painter: ArcPainter()),
          ),
        ),
      ),
    );
  }
}
