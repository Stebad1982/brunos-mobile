import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/add_meal_bottom_sheet_widget.dart';
import '../widgets/app_bar_with_back_widget.dart';

class MonthlyPlanScreen extends StatelessWidget {
  const MonthlyPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        appBar: const AppBarWithBackWidget(
          heading: 'Monthly Plan',
          showPuppy: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: black24w500Centre(
                          data:
                              'Let’s Feed Your Beloved\n${context.watch<AuthViewModel>().getAuthResponse.data!.pet!.name!}')),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: lightBlack14w400Centre(
                          data:
                              'You can select up to 3 delicious dishes per month')),
                  SizedBox(
                    height: 30.h,
                  ),
                  black18w500(data: 'Add Dishes'),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      plansViewModel.setScheduleEmptyTileNumber(1);
                      addMealDetailBottomSheetWidget();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: CustomColors.lightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 22),
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
                                child:
                                    plansViewModel.getScheduleEmptyTile1 != null
                                        ? Image.asset(
                                            plansViewModel
                                                .getScheduleEmptyTile1!
                                                .dishesModel
                                                .image!,
                                            height: 52.h,
                                          )
                                        : SizedBox(
                                            height: 52.h,
                                            width: 52.h,
                                          )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plansViewModel.getScheduleEmptyTile1 != null
                                    ? black16w500(
                                        data:
                                            'Days ${plansViewModel.getScheduleEmptyTile1!.totalDays}')
                                    : black16w500(data: 'Tap to Add Meal'),
                                plansViewModel.getScheduleEmptyTile1 != null? Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: black14w500(
                                      data: plansViewModel
                                          .getScheduleEmptyTile1!
                                          .dishesModel
                                          .name!),
                                ):Container(),

                                /*     Visibility(
                                  visible: plansViewModel.getScheduleEmptyTile1 == null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: black12w500Centre(data: 'tap to add meal'),
                                  ),
                                )*/
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
                  InkWell(
                    onTap: () {
                      plansViewModel.setScheduleEmptyTileNumber(2);
                      addMealDetailBottomSheetWidget();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: CustomColors.lightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 22),
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
                                child:
                                plansViewModel.getScheduleEmptyTile2 != null
                                    ? Image.asset(
                                  plansViewModel
                                      .getScheduleEmptyTile2!
                                      .dishesModel
                                      .image!,
                                  height: 52.h,
                                )
                                    : SizedBox(
                                  height: 52.h,
                                  width: 52.h,
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plansViewModel.getScheduleEmptyTile2 != null
                                    ? black16w500(
                                    data:
                                    'Days ${plansViewModel.getScheduleEmptyTile2!.totalDays}')
                                    : black16w500(data: 'Tap to Add Meal'),
                                plansViewModel.getScheduleEmptyTile2 != null? Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: black14w500(
                                      data: plansViewModel
                                          .getScheduleEmptyTile2!
                                          .dishesModel
                                          .name!),
                                ):Container(),

                                /*     Visibility(
                                  visible: plansViewModel.getScheduleEmptyTile1 == null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: black12w500Centre(data: 'tap to add meal'),
                                  ),
                                )*/
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
                  InkWell(
                    onTap: () {
                      plansViewModel.setScheduleEmptyTileNumber(3);
                      addMealDetailBottomSheetWidget();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: CustomColors.lightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 22),
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
                                child:
                                plansViewModel.getScheduleEmptyTile3 != null
                                    ? Image.asset(
                                  plansViewModel
                                      .getScheduleEmptyTile3!
                                      .dishesModel
                                      .image!,
                                  height: 52.h,
                                )
                                    : SizedBox(
                                  height: 52.h,
                                  width: 52.h,
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plansViewModel.getScheduleEmptyTile3 != null
                                    ? black16w500(
                                    data:
                                    'Days ${plansViewModel.getScheduleEmptyTile3!.totalDays}')
                                    : black16w500(data: 'Tap to Add Meal'),
                                plansViewModel.getScheduleEmptyTile3 != null? Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: black14w500(
                                      data: plansViewModel
                                          .getScheduleEmptyTile3!
                                          .dishesModel
                                          .name!),
                                ):Container(),

                                /*     Visibility(
                                  visible: plansViewModel.getScheduleEmptyTile1 == null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: black12w500Centre(data: 'tap to add meal'),
                                  ),
                                )*/
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
                ],
              ),
              SizedBox(
                height: screenHeight,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: customButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(context, deliveryDatesRoute);
                      },
                      colored: true),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
