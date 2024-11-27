import 'package:flutter/material.dart';
import 'package:todoapp/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //     scaffoldBackgroundColor: Color.fromARGB(255, 125, 238, 247)),
      home: OnBoarding(),
    );
  }
}
