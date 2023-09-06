import 'package:brunos_kitchen/models/dishes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/cart_model.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import 'circular_network_image_widget.dart';

Widget cartDishVerticalListChipWidget({required SelectedDishModel cartDish}) {
  return Column(
    children: [
      InkWell(
        onTap: () {},
        child: Container(
          decoration: ShapeDecoration(
            color: CustomColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [ circularNetworkImageWidget(
                        image: cartDish.dishesModel.image!, size: 40.h),

                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        black14w500(data: cartDish.dishesModel.name!),
                        black14w500(data: 'Days: ${cartDish.totalDays}'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
