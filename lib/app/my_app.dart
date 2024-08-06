import 'package:flutter/material.dart';
import 'package:unicornect/app/screens/sign_in_screen.dart';
import 'package:unicornect/app/screens/onboarding.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 239, 247, 255),
          surface: const Color.fromARGB(255, 239, 247, 255)
        ),
      ),
    );
  }


}