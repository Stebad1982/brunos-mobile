import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

Widget addressVerticalListChipWidget() {
  return Column(
    children: [
      Container(
        decoration: ShapeDecoration(
          color: CustomColors.lightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.3,
                child: Radio(
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: "radio value",
                    groupValue: "group value",
                    onChanged: (value) {
                      print(value); //selected value
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  black18w500(data: 'Mina Jebel Ali'),
                  black14w400Centre(data: 'Dubai - UAE'),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      navigatorKey.currentContext!, addAddressRoute);
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: CustomColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.75, color: CustomColors.greyMediumColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: CustomColors.orangeColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
