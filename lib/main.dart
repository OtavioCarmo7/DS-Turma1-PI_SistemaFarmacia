
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const SanusApp());
}

class SanusApp extends StatelessWidget {
  const SanusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SANUS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003D7A),
          primary: const Color(0xFF003D7A),
          secondary: const Color(0xFF00B4D8),
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}
