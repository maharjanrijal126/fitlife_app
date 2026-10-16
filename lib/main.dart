import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FitLifeApp());
}

class FitLifeApp extends StatelessWidget {
  const FitLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLife',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2DA783)),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}
