import 'package:ai_mental_health/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HedlineText extends StatelessWidget {
  const HedlineText({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      'Mental',
      'Health',
      'is',
      'a',
      'person\'s',
      'emotional,',
      'psychological,',
      'and',
      'social',
      'well-being.',
    ];
    return SizedBox(
      width: size.width * 0.75,
      child: Wrap(
        alignment: WrapAlignment.center,
        children:
            texts.asMap().entries.map((e) {
              return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: AppText(
                      text: e.value,
                      fontSize: 20,
                      textAlign: TextAlign.center,
                      height: 1.1,
                      softWrap: true,

                      fontWeight: FontWeight.w300,
                    ),
                  )
                  .animate(delay: Duration(milliseconds: 600 + (40 * e.key)))
                  .fade(duration: const Duration(milliseconds: 600))
                  .moveY(
                    duration: const Duration(milliseconds: 500),
                    begin: 20,
                    end: 0,
                  );
            }).toList(),
      ),
    );
  }
}
