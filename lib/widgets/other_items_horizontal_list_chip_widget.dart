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

Widget otherItemsHorizontalListChipWidget() {
  return Card(
      elevation: 5,
      color: CustomColors.whiteColor,
      borderOnForeground: false,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: CustomColors.whiteColor),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 8.0, bottom: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.lightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Image.asset(
                      bone,
                      height: 96.h,
                    )),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFEA5B5B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                          child: white8w500(data: '24% Off'),
                        ),
                      ),
                  ),
                )
              ],
            ),
            black14w400Centre(data: 'Wishbone Bacon Chew Toy For Dogs',left: true),
            brown12w500Centre(data: 'AED 50'),
          ],
        ),
      ));
}
