import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff4D754A);
  static const Color secondColor = Color(0xffD9FCD6);
  static const Color thirdColor = Color(0xffF7F7F7);
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.primaryColor,
      ColorPalette.secondColor,
    ],
  );
}