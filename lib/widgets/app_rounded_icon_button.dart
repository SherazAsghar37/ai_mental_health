import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppRoundedIconButton extends StatelessWidget {
  final String source;
  final BoxFit fit;
  final double size;
  final bool enableBorder;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color borderColor;
  const AppRoundedIconButton({
    super.key,
    required this.source,
    this.size = 20,
    this.fit = BoxFit.cover,
    this.enableBorder = false,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
    this.padding = const EdgeInsets.all(15),
    this.borderColor = Colours.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onPressed: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border:
              enableBorder ? Border.all(color: borderColor, width: 1) : null,
        ),
        child: SizedBox(
          height: size,
          width: size,
          child: SvgPicture.asset(source, width: size, height: size, fit: fit),
        ),
      ),
    );
  }
}
