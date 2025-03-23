import 'package:ai_mental_health/screens/ai-chat/ai_chat_screen.dart';
import 'package:ai_mental_health/screens/home/models/data_model.dart';
import 'package:ai_mental_health/utils/assets.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/widgets/app_rounded_icon_button.dart';
import 'package:ai_mental_health/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';

class FirstGridContainer extends StatelessWidget {
  final Color? color;
  final DataModel data;

  const FirstGridContainer({super.key, this.color, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BouncingButton(
      onPressed: () {
        Navigator.pushNamed(context, AIChatScreen.routeName, arguments: data);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
        height: 290,
        decoration: BoxDecoration(
          color: (color ?? Colours.brownColor).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              top: 10,
              right: -50,
              child: SizedBox(
                height: 450,
                width: 200,
                child: Image.asset(data.image, fit: BoxFit.cover),
              ),
            ),

            SizedBox(
              width: size.width * 0.25,
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
                                fontSize: 18,
                                fontWeight:
                                    e.key % 2 != 0
                                        ? FontWeight.w500
                                        : FontWeight.w300,
                                height: 1.1,
                              ),
                            ),
                          )
                          .toList(),
                ),
                textAlign: data.textAlignment,
              ),
            ),
            Positioned(
              right: 10,
              child: AppRoundedIconButton(
                source: Assets.arrowIcon,
                size: 15,
                backgroundColor: Colours.brownColor.withValues(alpha: 0.15),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
