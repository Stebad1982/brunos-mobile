import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../route_generator.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';

Widget mealVerticalListChipWidget() {
  return Column(
    children: [
      GestureDetector(
        onTap: (){
         // Navigator.pushNamed(navigatorKey.currentContext!, puppyCreationRoute);
        },
        child: Container(
          decoration: ShapeDecoration(
            color: CustomColors.lightGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    child: Image.asset(
                      food,
                      height: 52.h,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    black16w500(data: 'Beefy Barkfest'),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: const ShapeDecoration(
                    color: CustomColors.orangeColor,
                    shape: OvalBorder(),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: CustomColors.whiteColor,
                    ),
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
