import 'package:astroproject/helpers/grabtime.dart';
import 'package:flutter/material.dart';
import 'package:astroproject/screens/onboarding_screen.dart';
import 'package:get/get.dart';
void main() {

  print(getCurrentTime());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

