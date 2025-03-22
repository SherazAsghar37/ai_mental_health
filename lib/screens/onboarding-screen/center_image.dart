import 'package:flutter/material.dart';
import 'package:ai_mental_health/utils/assets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CenterImage extends StatefulWidget {
  final AnimationController _controller;
  const CenterImage({super.key, required AnimationController controller})
    : _controller = controller;

  @override
  State<CenterImage> createState() => _CenterImageState();
}

class _CenterImageState extends State<CenterImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _revealController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _revealAnimation;

  bool showFirstImage = true;

  @override
  void initState() {
    super.initState();
    _revealController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.8, 0.0),
    ).animate(
      CurvedAnimation(parent: widget._controller, curve: Curves.fastOutSlowIn),
    );

    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(parent: widget._controller, curve: Curves.fastOutSlowIn),
    );

    _revealAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _revealController, curve: Curves.fastOutSlowIn),
    );

    Future.delayed(const Duration(milliseconds: 400), () {
      _revealController.forward();
    });

    widget._controller.addListener(() {
      if (widget._controller.isCompleted) {
        setState(() {
          showFirstImage = !showFirstImage;
        });
        widget._controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _revealController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = 380;
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: AnimatedBuilder(
            animation: Listenable.merge([
              widget._controller,
              _revealController,
            ]),
            builder: (context, child) {
              return Container(
                clipBehavior: Clip.antiAlias,
                height: height * _revealAnimation.value,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: OverflowBox(
                    alignment: Alignment.bottomCenter,
                    maxHeight: height,
                    child: Transform.scale(
                      scale: 1.4,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Stack(
                          children: [
                            SlideTransition(
                              position:
                                  showFirstImage
                                      ? _slideAnimation
                                      : Tween<Offset>(
                                        begin: const Offset(-0.8, 0.0),
                                        end: Offset.zero,
                                      ).animate(
                                        CurvedAnimation(
                                          parent: widget._controller,
                                          curve: Curves.fastOutSlowIn,
                                        ),
                                      ),
                              child: Image.asset(
                                Assets.onboardingScreenIllustration1,
                                width: height,
                                height: height,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SlideTransition(
                              position:
                                  showFirstImage
                                      ? Tween<Offset>(
                                        begin: Offset(-0.8, 0),
                                        end: Offset.zero,
                                      ).animate(
                                        CurvedAnimation(
                                          parent: widget._controller,
                                          curve: Curves.fastOutSlowIn,
                                        ),
                                      )
                                      : _slideAnimation,
                              child: Image.asset(
                                Assets.onboardingScreenIllustration2,
                                width: height,
                                height: height,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
          .animate(delay: const Duration(milliseconds: 300))
          .fade(
            duration: const Duration(milliseconds: 700),
            curve: Curves.fastOutSlowIn,
          )
          .scale(
            duration: const Duration(milliseconds: 700),
            begin: Offset(1.5, 1.5),
            end: Offset(1, 1),
            curve: Curves.fastOutSlowIn,
          ),
    );
  }
}
