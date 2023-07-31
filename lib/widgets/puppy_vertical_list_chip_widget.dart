import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../route_generator.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';

Widget puppyVerticalListChipWidget(String puppyTag) {
  return Column(
    children: [
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(navigatorKey.currentContext!, puppyCreationRoute);
        },
        child: Container(
          decoration: ShapeDecoration(
            color: CustomColors.lightGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: ShapeDecoration(
                      color: CustomColors.yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(293),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: SvgPicture.asset(dogFace,height: 22.h,),
                    )),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    black14w400Centre(data: 'Labby'),
                    grey12w500(data: puppyTag),
                  ],
                ),
                Spacer(),
                Container(
                  decoration: ShapeDecoration(
                    color: CustomColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.75, color: CustomColors.greyMediumColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.edit,size: 20,color: CustomColors.orangeColor,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
