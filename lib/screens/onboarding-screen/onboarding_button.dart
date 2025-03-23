import 'package:ai_mental_health/utils/assets.dart';
import 'package:ai_mental_health/widgets/app_rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingButton extends StatelessWidget {
  final VoidCallback onPressed;
  const OnboardingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppRoundedIconButton(
          source: Assets.arrowIcon,
          enableBorder: true,
          size: 17,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          onPressed: onPressed,
        )
        .animate(delay: const Duration(milliseconds: 1300))
        .rotate(
          begin: -0.2,
          end: 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        )
        .scale(
          begin: Offset(0.0, 0.0),
          end: Offset(1, 1),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
  }
}
