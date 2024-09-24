import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/custom_colors.dart';
import '../../utils/enums.dart';
import '../../view_models/cart_view_model.dart';
import '../../view_models/plans_view_model.dart';

Widget shopItemsHorizontalListChipWidget({required RecipeModel productDetail}) {
  return InkWell(
    onTap: () {
      navigatorKey.currentContext!.read<CartViewModel>().setViewCartItemDetail(false);
      navigatorKey.currentContext!.read<PlansViewModel>().setPlanType(Plans.product.text);
      navigatorKey.currentContext!.read<PlansViewModel>().setSelectedRecipe(
          productDetail);
      navigatorKey.currentContext!.read<PlansViewModel>().clearPlanData();
      Navigator.pushNamed(navigatorKey.currentContext!, productDetailRoute);
    },
    child: Card(
        elevation: 2,
        color: CustomColors.whiteColor,
        borderOnForeground: false,
        shape: const RoundedRectangleBorder(
          // side: BorderSide(color: CustomColors.whiteColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 108.h,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: CustomColors.lightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15).w,
                    child: Center(
                      child: Image.network(
                        productDetail.media![0], height: 108.h,
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 12).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                        child: black14w400(data: productDetail.name!)),
                    SizedBox(
                      height: 6.h,
                    ),
                    brown12w500Centre(data: 'AED ${productDetail.pricePerKG!.toStringAsFixed(2)}'),
                    SizedBox(
                      height: 18.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
