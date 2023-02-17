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
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
          //     textTheme: TextTheme(
          //   displayLarge: TextStyle(color: Colors.red),
          //   displayMedium: TextStyle(color: Colors.red),
          // )
          // textButtonTheme: TextButtonThemeData(
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: const Color(0xFF3C47E9),
          //   ),
          // ),
          ),
      home: const MainScreen(),
    );
  }
}
