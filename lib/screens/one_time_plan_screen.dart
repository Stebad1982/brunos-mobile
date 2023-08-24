import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/food_discribed_grid_chip_widget.dart';

class OneTimePlanScreen extends StatelessWidget {
  const OneTimePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'OneTime Order', showPuppy: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Image.asset(
                  buyBulits2,
                  height: 57.h,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              black24w500Centre(
                  data: 'Let’s Feed Your Beloved Labby'),
              SizedBox(
                height: 10.h,
              ),
              lightBlack14w400Centre(data: 'Pick from any of our Bruno-approved delightful dishes below'),
              SizedBox(
                height: 30.h,
              ),
              black18w500(
                  data: 'Recommended Dishes'),
              SizedBox(
                height: 20.h,
              ),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 157.w,
                    child: foodDescribedGridChipWidget(),
                  );
                }),
              ),
              SizedBox(
                height: 30.h,
              ),
              black18w500(
                  data: 'Try our canine-crafted combos'),
              SizedBox(
                height: 20.h,
              ),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 157.w,
                    child: foodDescribedGridChipWidget(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
