import 'package:ai_mental_health/routes/routes_generator.dart';
import 'package:ai_mental_health/screens/onboarding-screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ai Mental Health',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: routesGenerator,
      home: OnboardingScreen(),
    );
  }
}
