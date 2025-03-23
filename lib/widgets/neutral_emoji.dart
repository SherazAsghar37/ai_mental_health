import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/emoji.dart';
import 'package:ai_mental_health/widgets/line_painter.dart';
import 'package:flutter/material.dart';

class NeutralEmoji extends StatelessWidget {
  const NeutralEmoji({super.key});

  @override
  Widget build(BuildContext context) {
    return Emoji(
      color: Colours.yellowColor,

      mouth: Positioned(
        bottom: 4,
        left: 22,
        child: SizedBox(
          height: 12,
          width: 18,
          child: CustomPaint(painter: LinePainter()),
        ),
      ),
    );
  }
}
