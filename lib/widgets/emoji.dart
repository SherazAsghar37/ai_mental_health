import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/eye_painter.dart';
import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  final Color? color;
  final Widget mouth;
  final Widget eyebrow;
  final Widget? eye;
  const Emoji({
    super.key,
    this.color,
    this.mouth = const SizedBox(),
    this.eyebrow = const SizedBox(),
    this.eye,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        color:
            color?.withValues(alpha: 0.3) ??
            Colours.blueColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          eyebrow,
          eye ??
              Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 15,
                    child: CustomPaint(
                      painter: EyePainter(),
                      size: const Size(8, 13),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 15,
                    child: CustomPaint(
                      painter: EyePainter(),
                      size: const Size(8, 13),
                    ),
                  ),
                ],
              ),
          mouth,
        ],
      ),
    );
  }
}
