import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';

//google font, color color2, size 25, bold
Widget googleFont1({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 25.sp,
        color: CustomColors.color2,
        fontWeight: FontWeight.bold),
  );
}

//google font, color color2, size 12, bold
Widget googleFont2({required String data, bool? click}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 12.sp,
        color:
            click != null && click ? CustomColors.color1 : CustomColors.color2,
        fontWeight: FontWeight.bold),
  );
}

//google font, color color1, size 12, bold

Widget googleFont3({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 12.sp,
        color: CustomColors.color1,
        fontWeight: FontWeight.bold),
  );
}

//google font, color color2, size 16, bold

Widget googleFont4({required String data, bool? click, bool? align}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 16.sp,
        color:
            click != null && click ? CustomColors.color1 : CustomColors.color2,
        fontWeight: FontWeight.bold),
    textAlign: align != null? TextAlign.center : null,
  );
}

//google font, color color4, size 12

Widget googleFont5({required String data}) {
  return Text(
    data,
    overflow: TextOverflow.ellipsis,
maxLines: 2,
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 12.sp,
      color: CustomColors.color4,
    ),
  );
}

//google font, color color4, size 12, bold
Widget googleFont6({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 12.sp,
        color: CustomColors.color4,
        fontWeight: FontWeight.bold),
  );
}

//google font, color color2, size 12

Widget googleFont7({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik', fontSize: 12.sp, color: CustomColors.color2),
  );
}

//google font, color color4, size 16, bold

Widget googleFont8({required String data,  bool? align}) {
  return Text(
    data,
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 16.sp,
      color: CustomColors.color4,
      fontWeight: FontWeight.bold,
    ),
    textAlign: align != null? TextAlign.center : null,
  );
}

//google font, color color4, size 25, bold
Widget googleFont9({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 25.sp,
        color: CustomColors.color4,
        fontWeight: FontWeight.bold),
  );
}

//google font, color color4, size 50, bold
Widget googleFont10({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 40.sp,
        color: CustomColors.color4,
        fontWeight: FontWeight.bold),
  );
}

//google font, color color1, size 14

Widget googleFont11({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14.sp,
        color: CustomColors.color1,
        ),
  );
}

//google font, color color1, size 16 bold

Widget googleFont12({required String data}) {
  return Text(
    data,
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 16.sp,
      color: CustomColors.color1,
      fontWeight: FontWeight.bold
    ),
  );
}

//google font, color color2, size 14

Widget googleFont13({required String data}) {
  return Text(
    data,
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: 14.sp,
      color: CustomColors.color2,
    ),
  );
}

//google font, color color2, size 8

Widget googleFont14({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Rubik', fontSize: 8.sp, color: CustomColors.color2),
  );
}
