import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:brunos_kitchen/view_models/puppy_view_model.dart';
import 'package:brunos_kitchen/widgets/recipe_detail_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import 'one_time_order_bottom_sheet_widget.dart';

Widget foodDescribedGridChipWidget() {
  return InkWell(
    onTap: () {
      navigatorKey.currentContext!.read<PlansViewModel>().getPlanType ==
              Plans.oneTime.text
          ? oneTimeOrderBottomSheetWidget()
          : Navigator.pushNamed(
              navigatorKey.currentContext!, deliveryDatesRoute);
    },
    child: Card(
        elevation: 8,
        color: CustomColors.whiteColor,
        borderOnForeground: false,
        shape: const RoundedRectangleBorder(
          // side: BorderSide(color: CustomColors.whiteColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: CustomColors.lightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          food,
                          height: 108.h,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          recipeDetailBottomSheetWidget();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(informationButton)),
                        ),
                      )
                      /*IconButton(
                            onPressed: () {
                              recipeDetailBottomSheetWidget();
                            },
                            icon: Icon(
                              Icons.info,
                              color: CustomColors.orangeColorTint,
                            ),
                          ))*/
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 17.0, right: 17, top: 7, bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lightBlack14w400Centre(data: 'Beefy Barkfest', left: true),
                    black10w400(
                        data: 'High protein, grain-free,picky eater approved'),
                    SizedBox(
                      height: 16.h,
                    ),
                    brown12w500Centre(data: 'AED 100 / Plan'),
                    SizedBox(
                      height: 2.h,
                    ),
                    black10w400(data: 'complete trans period'),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
