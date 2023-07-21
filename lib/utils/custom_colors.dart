import 'dart:ui';

import 'package:flutter/widgets.dart';

class CustomColors {
  static const Color color1 = Color.fromRGBO(215, 136, 9,1);
  static Color tintColor1 = const Color.fromRGBO(215, 136, 9, 0.5);

  static const Color color2 = Color.fromRGBO(65, 75, 88, 1);
  static Color tintColor2 = const Color.fromRGBO(65, 75, 88, 0.5);

  static const Color color3 = Color.fromRGBO(167, 175, 186, 1);
  static const Color color4 = Color.fromRGBO(252, 246, 245, 1);
  static const Color color5 = Color.fromRGBO(255, 184, 100, 1);
  static Color tintColor3 = const Color.fromRGBO(167, 175, 186, 0.5);
  static const Color color6 = Color.fromRGBO(118, 131, 159, 1);

  static Gradient gradientColor1 = const LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: <Color>[Color.fromRGBO(137, 171, 227,0.0),
    Color.fromRGBO(137, 171, 227,1),]);

  static LinearGradient linearGradient1 = const LinearGradient(colors: <Color>[Color.fromRGBO(255, 122, 0,1),
    Color.fromRGBO(255, 184, 0,1),]);

  static LinearGradient linearGradient2 = const LinearGradient(colors: <Color>[Color.fromRGBO(235, 114, 114,1),
    Color.fromRGBO(235, 20, 20,1),]);
}
