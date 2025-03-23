import 'package:ai_mental_health/screens/home/models/data_model.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  final Color? color;
  final DataModel data;

  const GridContainer({super.key, this.color, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
      height: 240,
      decoration: BoxDecoration(
        color: (color ?? Colours.brownColor).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            top: -15,
            right: -30,
            child: SizedBox(
              height: 450,
              width: 200,
              child: Image.asset(data.image, fit: BoxFit.cover),
            ),
          ),

          SizedBox(
            width: size.width * 0.36,
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
        ],
      ),
    );
  }
}
