import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';

//google font, color color2, size 25, bold
Widget googleFont1({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 32.sp,
        color: CustomColors.blackColor,
        fontWeight: FontWeight.w500),
  );
}

Widget googleFont2({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 32.sp,
        color: CustomColors.brownColor,
        fontWeight: FontWeight.w500),
  );
}

Widget googleFont3({required String data}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 14.sp,
        height: 1.8,
        fontWeight: FontWeight.w400,
        color: CustomColors.greyColor),
  );
}

