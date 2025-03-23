import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/angry_emoji.dart';
import 'package:ai_mental_health/widgets/app_text.dart';
import 'package:ai_mental_health/widgets/happy_emoji.dart';
import 'package:ai_mental_health/widgets/laughing_emoji.dart';
import 'package:ai_mental_health/widgets/neutral_emoji.dart';
import 'package:ai_mental_health/widgets/sad_emoji.dart';
import 'package:ai_mental_health/widgets/smile_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DailyMoodLog extends StatelessWidget {
  const DailyMoodLog({super.key});

  @override
  Widget build(BuildContext context) {
    final String text = "Daily mood Log";
    final List<Widget> emojis = [
      AngryEmoji(),
      SadEmoji(),
      NeutralEmoji(),
      SmileEmoji(),
      LaughingEmoji(),
      HappyEmoji(),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:
                text
                    .split(" ")
                    .asMap()
                    .entries
                    .map(
                      (e) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: AppText(
                              text: e.value,
                              color: Colours.primaryTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                          .animate(
                            delay: Duration(milliseconds: 600 + (50 * e.key)),
                          )
                          .fade(duration: const Duration(milliseconds: 400))
                          .moveY(
                            duration: const Duration(milliseconds: 300),
                            begin: 10,
                            end: 0,
                          ),
                    )
                    .toList(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 5,
              children:
                  emojis
                      .asMap()
                      .entries
                      .map(
                        (e) => e.value
                            .animate(
                              delay: Duration(milliseconds: 750 + (50 * e.key)),
                            )
                            .fade(duration: const Duration(milliseconds: 500))
                            .moveY(
                              duration: const Duration(milliseconds: 400),
                              begin: 20,
                              end: 0,
                            ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
