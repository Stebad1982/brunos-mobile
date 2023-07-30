import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';

Widget googleFacebookButtonWidget(){
 return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 159.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                width: 1, color: CustomColors.greyMediumColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                googleIcon,
                width: 23,
                height: 23,
              ),
              SizedBox(
                width: 12.w,
              ),
              black12w500Centre(data: 'Google')
            ],
          ),
        ),
      ),
      const Spacer(),
      Container(
        width: 159.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                width: 1, color: CustomColors.greyMediumColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                facebookIcon,
                width: 23,
                height: 23,
              ),
              SizedBox(
                width: 12.w,
              ),
              black12w500Centre(data: 'Facebook')
            ],
          ),
        ),
      ),
    ],
  );
}