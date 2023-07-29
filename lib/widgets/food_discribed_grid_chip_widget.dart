import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/view_models/puppy_view_model.dart';
import 'package:brunos_kitchen/widgets/recipe_detail_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/enums.dart';

Widget foodDescribedGridChipWidget() {
  return Card(
      elevation: 0,
      color: CustomColors.lightGreyColor,
      borderOnForeground: false,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: CustomColors.whiteColor),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Image.asset(
                      food,
                      height: 96.h,
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        recipeDetailBottomSheetWidget();
                      },
                      icon: Icon(
                        Icons.info,
                        color: CustomColors.orangeColorTint,
                      ),
                    ))
              ],
            ),
            black14w400Centre(data: 'Beefy Barkfest'),
            black10w400(data: 'High protein, grain-free,picky eater approved'),
            brown12w500(data: 'AED 100 / Plan'),
            black10w400(data: 'complete trans period'),
          ],
        ),
      ));
}
