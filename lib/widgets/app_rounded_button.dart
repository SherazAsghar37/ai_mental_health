import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/app_text.dart';
import 'package:ai_mental_health/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final BoxFit fit;
  final double height;
  final bool enableBorder;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final bool isSelected;
  const AppRoundedButton({
    super.key,
    required this.text,
    this.width = 50,
    this.fit = BoxFit.cover,
    this.height = 50,
    this.enableBorder = false,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          border:
              enableBorder
                  ? Border.all(color: Colours.borderColor, width: 1)
                  : null,
        ),
        child: AppText(
          text: text,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
          color: isSelected ? Colours.blackColor : Colours.borderColor,
        ),
      ),
    );
  }
}
