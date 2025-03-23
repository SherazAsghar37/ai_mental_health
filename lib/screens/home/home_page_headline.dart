import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePageHeadline extends StatelessWidget {
  const HomePageHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Hey, ',
                  style: TextStyle(
                    fontFamily: 'URWGeometric',
                    color: Colours.primaryTextColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: 'Marcus',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              AppText(
                text: 'How are you doing today?',
                color: Colours.primaryTextColor,
                fontSize: 28,
                fontWeight: FontWeight.w300,
                height: 0.8,
              ),
            ],
          )
          .animate()
          .rotate(
            duration: const Duration(milliseconds: 400),
            begin: -0.05,
            end: 0,
          )
          .scale(
            duration: const Duration(milliseconds: 400),
            begin: Offset(3, 3),
            end: Offset(1, 1),
          ),
    );
  }
}
