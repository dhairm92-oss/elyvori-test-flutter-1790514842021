import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TestFlutterApp());
}

class TestFlutterApp extends StatelessWidget {
  const TestFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
