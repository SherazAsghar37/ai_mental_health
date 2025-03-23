import 'package:ai_mental_health/screens/home/models/data_model.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AIChatTitle extends StatelessWidget {
  const AIChatTitle({super.key, required this.size, required this.data});

  final Size size;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            AppText(
              text: "5 minutes",
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(
              width: size.width * 0.6,
              child: RichText(
                text: TextSpan(
                  children:
                      data.title
                          .split('-')
                          .asMap()
                          .entries
                          .map(
                            (e) => TextSpan(
                              text: e.value,
                              style: TextStyle(
                                color: Colours.primaryTextColor,
                                fontSize: 25,
                                fontWeight:
                                    e.key % 2 != 0
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                height: 1.1,
                              ),
                            ),
                          )
                          .toList(),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
        .animate(delay: Duration(milliseconds: 300))
        .fade(
          begin: 0,
          end: 1,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
        )
        .scale(
          begin: Offset(3, 3),
          end: Offset(1, 1),
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
        );
  }
}
