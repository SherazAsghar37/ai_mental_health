import 'dart:math';

import 'package:ai_mental_health/utils/colours.dart';
import 'package:flutter/material.dart';

extension BackgroundExtension on Widget {
  Widget gradient({required Color topRight, required Color bottomLeft}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          transform: GradientRotation(pi * 0.1),
          stops: [0.0, 0.25, 0.75, 1],
          colors: [
            topRight,
            Colours.backgroundColor,
            Colours.backgroundColor,
            bottomLeft,
          ],
        ),
      ),
      child: this,
    );
  }
}
