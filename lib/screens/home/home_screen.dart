import 'package:ai_mental_health/screens/home/ai_features_grid.dart';
import 'package:ai_mental_health/screens/home/custom_app_bar.dart';
import 'package:ai_mental_health/screens/home/custom_tab_bar.dart';
import 'package:ai_mental_health/screens/home/daily_mood_log.dart';
import 'package:ai_mental_health/screens/home/home_page_headline.dart';
import 'package:ai_mental_health/utils/colours.dart';
import 'package:ai_mental_health/utils/extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              children: [
                CustomAppBar(),
                HomePageHeadline(),
                CustomTabBar(),
                DailyMoodLog(),
                AIFeaturesGrid(),
              ],
            ),
          ),
        ),
      ).gradient(topRight: Colours.pinkColor, bottomLeft: Colours.whiteColor),
    );
  }
}
