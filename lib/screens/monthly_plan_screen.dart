import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../widgets/add_meal_bottom_sheet_widget.dart';
import '../widgets/app_bar_with_back_widget.dart';

class MonthlyPlanScreen extends StatelessWidget {
  const MonthlyPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'Monthly Plan',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child:
                        black24w500Centre(data: 'Let’s feed your beloved Labby')),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: black14w400Centre(
                        data: 'You can select up to 3 delicious dishes per month')),
                SizedBox(
                  height: 30.h,
                ),
                black18w500(data: 'Add Dishes'),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: (){
                    recipeDetailBottomSheetWidget();
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
                              black16w500(data: 'Day 1-11'),
                              SizedBox(
                                height: 5.h,
                              ),
                              black12w500Centre(data: 'tap to add meal')
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
                  onTap: (){
                    recipeDetailBottomSheetWidget();
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
                              black16w500(data: 'Day 1-11'),
                              SizedBox(
                                height: 5.h,
                              ),
                              black12w500Centre(data: 'tap to add meal')
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
                  onTap: (){
                    recipeDetailBottomSheetWidget();
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
                              black16w500(data: 'Day 1-11'),
                              SizedBox(
                                height: 5.h,
                              ),
                              black12w500Centre(data: 'tap to add meal')
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
                child: customButton(text: 'Continue', onPressed: () {
Navigator.pushNamed(context, deliveryDatesRoute);
                }, colored: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
