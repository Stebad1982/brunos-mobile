
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/view_models/address_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';

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
              Container(
                decoration: BoxDecoration(
                  color:
                  CustomColors.whiteColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1,
                      color: CustomColors.orangeColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    homeAddressIcon,
                    width: 24.w,
                    color:  CustomColors.orangeColor,
                  ),
                ),
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
                  navigatorKey.currentContext!.read<AddressViewModel>().setIsAddressAdd(false);
                  Navigator.pushNamed(
                      navigatorKey.currentContext!, addAddressRoute2);
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
