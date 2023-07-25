import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';

Widget black32w500Center({required String data}) {
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

Widget black24w500({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 24.sp,
        color: CustomColors.blackColor,
        fontWeight: FontWeight.w500),
  );
}

Widget brown32w500({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 32.sp,
        color: CustomColors.brownColor,
        fontWeight: FontWeight.w500),
  );
}

Widget grey14w400HeightCentre({required String data}) {
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
Widget grey14w400({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: CustomColors.greyColor),
  );
}

Widget orange14w400({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: CustomColors.orangeColor),
  );
}
