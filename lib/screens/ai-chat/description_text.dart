import 'package:ai_mental_health/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Breathing",
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                  Expanded(
                    child: AppText(
                      text:
                          "Envying others can bling us to our own treasures , leading to loss, as seen in the story of the greedy dog.",
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
        .animate(delay: Duration(milliseconds: 850))
        .fadeIn(
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        )
        .slideY(
          begin: 0.2,
          end: 0,
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        );
  }
}
