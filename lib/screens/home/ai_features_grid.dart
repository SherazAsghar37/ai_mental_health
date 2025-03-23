import 'package:ai_mental_health/screens/home/first_grid_container.dart';
import 'package:ai_mental_health/screens/home/grid_container.dart';
import 'package:ai_mental_health/screens/home/models/data_model.dart';
import 'package:ai_mental_health/utils/assets.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AIFeaturesGrid extends StatefulWidget {
  const AIFeaturesGrid({super.key});

  @override
  State<AIFeaturesGrid> createState() => _AIFeaturesGridState();
}

class _AIFeaturesGridState extends State<AIFeaturesGrid> {
  final List<DataModel> data = [
    DataModel(image: Assets.gridImage1, title: "Inhale -Exhale- for Balance"),
    DataModel(
      image: Assets.gridImage2,
      title: '-Breathe- in, Breathe out for Calm',
      textAlignment: TextAlign.center,
    ),
    DataModel(
      image: Assets.gridImage3,
      title: 'Deep Breaths for -Mental- Clarity',
    ),
    DataModel(
      image: Assets.gridImage4,
      textAlignment: TextAlign.center,
      title: 'Unlock your inner -Peace- with meditation',
    ),
    DataModel(
      image: Assets.gridImage5,
      textAlignment: TextAlign.center,
      title: "Let Your -Thoughts- Drift Away",
    ),
    DataModel(
      image: Assets.gridImage6,
      title: 'Quiet Your -Mind-, Find Your Balance"',
      textAlignment: TextAlign.center,
    ),
    DataModel(
      image: Assets.gridImage7,
      title: 'Find Your Anchor in the -Present-',
    ),
    DataModel(image: Assets.gridImage8, title: 'Feel the -World- Slow Down'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children:
            data.asMap().entries.map((e) {
              return StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: (e.key == 0
                        ? FirstGridContainer(
                          data: e.value,
                          color:
                              Colours.cardsColours[e.key %
                                  Colours.cardsColours.length],
                        )
                        : GridContainer(
                          color:
                              Colours.cardsColours[e.key %
                                  Colours.cardsColours.length],
                          data: e.value,
                        ))
                    .animate(delay: Duration(milliseconds: 1000 + (80 * e.key)))
                    .fadeIn(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    )
                    .moveY(
                      curve: Curves.fastOutSlowIn,
                      begin: 50,
                      end: 0,
                      duration: const Duration(milliseconds: 500),
                    ),
              );
            }).toList(),
      ),
    );
  }
}
