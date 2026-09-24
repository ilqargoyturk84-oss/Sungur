import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SungurApp());
}

class SungurApp extends StatelessWidget {
  const SungurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sungur',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const SungurHomeScreen(),
    );
  }
}
