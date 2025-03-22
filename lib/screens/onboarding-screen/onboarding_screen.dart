import 'package:ai_mental_health/screens/onboarding-screen/center_image.dart';
import 'package:ai_mental_health/screens/onboarding-screen/headline_text.dart';
import 'package:ai_mental_health/screens/onboarding-screen/moto_text.dart';
import 'package:ai_mental_health/screens/onboarding-screen/pattern_background.dart';
import 'package:ai_mental_health/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:ai_mental_health/utils/assets.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/app_rounded_icon_button.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _textAnimationController;

  bool completed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  void _toggleImage() {
    if (!completed) {
      _textAnimationController.forward();
      _animationController.forward().then((value) {
        setState(() {
          completed = !completed;
        });
      });
    } else {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      body: SafeArea(
        child: Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Column(
            children: [
              MotoText(textAnimationController: _textAnimationController)
                  .animate()
                  .fade(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  )
                  .scale(begin: Offset(2, 2), end: Offset(1, 1)),
              SizedBox(
                height: size.height * 0.46,
                width: size.width,
                child: Stack(
                  children: [
                    PatternBackground(),
                    CenterImage(controller: _animationController),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              HedlineText(size: size),
              const SizedBox(height: 20),
              AppRoundedIconButton(
                    source: Assets.arrowIcon,
                    enableBorder: true,
                    size: 17,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 32,
                    ),
                    onPressed: _toggleImage,
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
                  ),
            ],
          ),
        ),
      ).gradient(topRight: Colours.blueColor, bottomLeft: Colours.yellowColor),
    );
  }
}
