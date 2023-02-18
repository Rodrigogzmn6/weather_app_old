import 'package:flutter/material.dart';

import 'screens/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return const MaterialApp(
      title: 'Weather App',
      home: MainScreen(),
    );
  }
}
