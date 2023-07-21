import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';

Widget customButton ({required String text,required VoidCallback onPressed, required bool colored}){
  return SizedBox(
    height: 40.h,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colored ? CustomColors.color2 : CustomColors.color4,
        shape: const StadiumBorder(side: BorderSide(width: 1.0,color: CustomColors.color2)),
      ),
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(
              color: colored ? CustomColors.color4 : CustomColors.color2)),
    ),
  );
}




