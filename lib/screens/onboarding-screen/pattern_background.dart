import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ai_mental_health/utils/assets.dart';

class PatternBackground extends StatefulWidget {
  const PatternBackground({super.key});

  @override
  State<PatternBackground> createState() => _PatternBackgroundState();
}

class _PatternBackgroundState extends State<PatternBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> rotationAnmaition;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    rotationAnmaition = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: pi * rotationAnmaition.value,
            child: Opacity(
              opacity: 0.02,
              child: Image.asset(Assets.circularArt),
            ),
          );
        },
      ),
    );
  }
}
