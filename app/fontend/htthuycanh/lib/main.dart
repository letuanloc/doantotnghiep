import 'package:flutter/material.dart';
import 'package:htthuycanh/core/const/color_const.dart';
import 'package:htthuycanh/representation/routes.dart';
import 'package:htthuycanh/representation/screens/plash_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoTHydro',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.thirdColor,
        useMaterial3: true,
      ),
      routes: routes,
      home: const SplashScreen(),
    );
  }
}



