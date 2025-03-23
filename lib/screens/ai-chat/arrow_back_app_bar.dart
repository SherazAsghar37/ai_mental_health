import 'package:ai_mental_health/utils/assets.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/app_rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ArrowBackAppBar extends StatelessWidget {
  const ArrowBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppRoundedIconButton(
              source: Assets.iconBackIOS,
              onPressed: () => Navigator.pop(context),
              size: 14,
              enableBorder: true,
              padding: const EdgeInsets.all(13),
              borderColor: Colours.borderColor,
            ),
          ],
        )
        .animate(delay: Duration(milliseconds: 200))
        .fadeIn(duration: const Duration(milliseconds: 1300));
  }
}
