import 'dart:ui';

import 'package:flutter/widgets.dart';

class CustomColors {
  static const Color orangeColor = Color.fromRGBO(215, 136, 9,1);
  static Color orangeColorTint = const Color.fromRGBO(215, 136, 9, 0.3);

  static const Color brownColor = Color.fromRGBO(106, 51, 12,1);
  static Color brownColorTint = const Color.fromRGBO(106, 51, 12, 0.5);

  static const Color blackColor = Color.fromRGBO(10, 11, 14, 1);
  static Color blackColorTint = const Color.fromRGBO(10, 11, 14, 0.5);

  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color whiteColorTint = Color.fromRGBO(255, 255, 255, 0.5);

  static const Color greyColor = Color.fromRGBO(133, 136, 141, 1);
  static const Color greyMediumColor = Color.fromRGBO(245, 242, 251, 1);
  static const Color greyMediumLightColor = Color.fromRGBO(239, 239, 239, 1);
  static const Color lightGreyColor = Color.fromRGBO(248, 248, 249, 1);

  static const Color yellowColor = Color.fromRGBO(217, 174, 14, 1);
  static const Color purpleColor = Color.fromRGBO(123, 76, 223, 1);


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
