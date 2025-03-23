import 'package:ai_mental_health/widgets/app_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Row(
        key: ValueKey<int>(0),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppRoundedButton(
                text: 'Proficiency',
                isSelected: _selectedIndex == 0,
                onPressed: () => setState(() => _selectedIndex = 0),
              )
              .animate(delay: Duration(milliseconds: 400))
              .slideY(
                duration: const Duration(milliseconds: 400),
                begin: 0.5,
                end: 0,
              )
              .fade(duration: const Duration(milliseconds: 400)),
          const SizedBox(width: 15),
          AppRoundedButton(
                text: 'Uniqueness',
                isSelected: _selectedIndex == 1,
                onPressed: () => setState(() => _selectedIndex = 1),
              )
              .animate(delay: Duration(milliseconds: 400))
              .slideY(
                duration: const Duration(milliseconds: 400),
                begin: 0.5,
                end: 0,
              )
              .fade(duration: const Duration(milliseconds: 400)),
        ],
      ),
    );
  }
}
