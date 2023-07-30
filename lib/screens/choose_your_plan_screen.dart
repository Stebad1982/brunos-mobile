import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import '../widgets/app_bar_with_back_widget.dart';

class ChooseYourPlanScreen extends StatelessWidget {
  const ChooseYourPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'Choose your plan',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              buyBulits2,
              height: 57.h,
            ),
            SizedBox(
              height: 40.h,
            ),
            black24w500Centre(
                data: 'Create a paw-licking good meal plan for Labby'),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: () {
                context.read<PlansViewModel>().setPlanType(Plans.transitional.text);
                Navigator.pushNamed(context, transitionPlanRoute);
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 0.50, color: CustomColors.greyColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        transitionPlan,
                        height: 44.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            black18w500(data: 'Transitional Plan'),
                            SizedBox(
                              height: 5.h,
                            ),
                            black14w400Centre(
                                data:
                                    'First-Timers: Ease your pup into Bruno\'s recipes. Post-transition, enjoy a wider menu!',
                                left: true)
                          ],
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
                context.read<PlansViewModel>().setPlanType(Plans.monthly.text);
                Navigator.pushNamed(context, monthlyPlanRoute);
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 0.50, color: CustomColors.greyColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        monthlyPlan,
                        height: 44.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            black18w500(data: 'Monthly Plan'),
                            SizedBox(
                              height: 5.h,
                            ),
                            black14w400Centre(
                                data:
                                    'For an affordable, varied meal adventure. Three monthly meal choices for your pup\'s delight!',
                                left: true)
                          ],
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
                context.read<PlansViewModel>().setPlanType(Plans.oneTime.text);
                Navigator.pushNamed(context, oneTimePlanRoute);
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 0.50, color: CustomColors.greyColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        onetimePlan,
                        height: 44.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            black18w500(data: 'One-time Order'),
                            SizedBox(
                              height: 5.h,
                            ),
                            black14w400Centre(
                                data:
                                    'Hesitant? Sample our meals and let your doggie be the gourmet judge!',
                                left: true)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
