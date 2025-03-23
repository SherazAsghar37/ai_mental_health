import 'package:flutter/material.dart';
import 'package:ai_mental_health/widgets/app_text.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MotoText extends StatefulWidget {
  final AnimationController _textAnimationController;
  const MotoText({
    super.key,
    required AnimationController textAnimationController,
  }) : _textAnimationController = textAnimationController;

  @override
  State<MotoText> createState() => _MotoTextState();
}

class _MotoTextState extends State<MotoText>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool showFirstText = true;

  @override
  void initState() {
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.0),
      end: const Offset(0, 0.5),
    ).animate(
      CurvedAnimation(
        parent: widget._textAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: widget._textAnimationController,
        curve: Curves.ease,
      ),
    );

    widget._textAnimationController.addListener(() {
      if (widget._textAnimationController.isCompleted) {
        setState(() {
          showFirstText = !showFirstText;
        });
        widget._textAnimationController.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
          height: size.height * 0.17,
          width: size.width,
          child: Center(
            child: AnimatedBuilder(
              animation: widget._textAnimationController,
              builder: (context, child) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity:
                            showFirstText
                                ? _fadeAnimation.value
                                : 1 - _fadeAnimation.value,
                        child: SlideTransition(
                          position:
                              showFirstText
                                  ? _slideAnimation
                                  : Tween<Offset>(
                                    begin: const Offset(0, -0.5),
                                    end: const Offset(0, 0),
                                  ).animate(
                                    CurvedAnimation(
                                      parent: widget._textAnimationController,
                                      curve: Curves.fastOutSlowIn,
                                    ),
                                  ),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 15,
                              children: const [
                                AppText(text: "Gain", fontSize: 40),
                                AppText(
                                  text: "Self-Belief",
                                  fontSize: 40,
                                  height: 0.001,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity:
                            showFirstText
                                ? 1 - _fadeAnimation.value
                                : _fadeAnimation.value,
                        child: SlideTransition(
                          position:
                              showFirstText
                                  ? Tween<Offset>(
                                    begin: const Offset(0, -0.5),
                                    end: const Offset(0, 0),
                                  ).animate(
                                    CurvedAnimation(
                                      parent: widget._textAnimationController,
                                      curve: Curves.fastOutSlowIn,
                                    ),
                                  )
                                  : _slideAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 15,
                            children: const [
                              AppText(text: "Happiness", fontSize: 40),
                              AppText(
                                text: "Focused",
                                fontSize: 40,
                                height: 0.001,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(text: "Resources", fontSize: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        )
        .animate()
        .fade(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        )
        .scale(begin: Offset(2, 2), end: Offset(1, 1));
  }
}
