import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/models/responses/auth_response.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/recipes_calculation.dart';

Future recipeDetailBottomSheetWidget({required RecipeModel recipeDetail}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: CustomColors.whiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: navigatorKey.currentContext!,
      builder: (context) {
        return SizedBox(
          height: 650.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        black18w500(data: recipeDetail.name!),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                            child: grey14w400(data: recipeDetail.description!)),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          color: CustomColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.75,
                                color: CustomColors.greyMediumColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.clear,
                            size: 20,
                            color: CustomColors.greyColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const TabBar(
                        indicatorColor: CustomColors.blackColor,
                        dividerColor: CustomColors.greyColor,
                        labelColor: CustomColors.blackColor,
                        tabs: <Widget>[
                          Tab(text: 'Details'),
                          Tab(text: 'Nutrition'),
                          Tab(text: 'Instructions'),
                        ],
                      ),
                      SizedBox(
                        height: 480.h,
                        //I want to use dynamic height instead of fixed height
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TabBarView(
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    black12w500Centre(
                                        lineSpacing: true,
                                        data:recipeDetail.details!),
                                    SizedBox(height: 27.h),
                                    Container(
                                      width: double.infinity,
                                      decoration: const ShapeDecoration(
                                        color: CustomColors.lightGreyColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child:
                                            black16w500(data: 'Specifications'),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Item Number')),
                                            Expanded(
                                                child: black14w400(
                                                    data: recipeDetail.recipeNo!.toString())),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Made in')),
                                            Expanded(
                                                child:
                                                    black14w400(data: 'UAE')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child:
                                                    grey14w400(data: 'Weight')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 Pounds')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    black12w500Centre(
                                        lineSpacing: true,
                                        data: recipeDetail.ingredientsComposition!),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    ListView.builder(physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: recipeDetail.nutrition!.length,
                                      //padding: const EdgeInsets.only(left: 20, right: 20),
                                      itemBuilder: (BuildContext context, int index) {
                                        return
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_circle,
                                                    color: CustomColors.greenColor,
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  black14w400(
                                                      data: recipeDetail.nutrition![index])
                                                ],
                                              ),
                                              SizedBox(height: 10.h,)
                                            ],
                                          );
                                      },),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    black12w500Centre(data: 'Feeding plan – ${calculateFeedingPlan(recipeModel: recipeDetail)} grams ${context.watch<AuthViewModel>().getAuthResponse.data!.pet!.feedingRoutine!} times per day'),
                                    /*Container(
                                      width: double.infinity,
                                      decoration: const ShapeDecoration(
                                        color: CustomColors.lightGreyColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: black16w500(
                                                    data: 'Weight')),
                                            Expanded(
                                                child: black16w500(
                                                    data: 'Daily Feeding')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Up to 10 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1/4 - 1')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: 'Up - 25 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 - 1 3/4')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: '25 - 50 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 - 1 3/4')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: '50 - 75 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 - 1 3/4')),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        border: Border.all(
                                            color:
                                                CustomColors.greyMediumColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: grey14w400(
                                                    data: '75 - 150 lbs')),
                                            Expanded(
                                                child: black14w400(
                                                    data: '1 3/4 - 3')),
                                          ],
                                        ),
                                      ),
                                    ),*/
                                    SizedBox(
                                      height: 27.h,
                                    ),
                                    black12w500Centre(
                                        lineSpacing: true,
                                        data:recipeDetail.instructions!),
                                    SizedBox(
                                      height: 27.h,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
