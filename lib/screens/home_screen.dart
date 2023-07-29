import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/food_category_grid_chip_widget.dart';
import '../widgets/food_grid_chip_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGreyColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 150),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            purple10w500Centre(data: 'LOCATION'),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: CustomColors.purpleColor,
                            )
                          ],
                        ),
                        black14w400Centre(data: '46 Larkrow, London')
                      ],
                    ),
                    SvgPicture.asset(
                      shoppingIcon,
                      height: 44.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 200.w,
                child: const CarouselWidget(),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: black24w500Centre(
                    data:
                    'Trademarked Nutrient Blends, Exclusively Crafted for Your Pup\'s Special Needs.'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: black14w400Centre(
                    data:
                    'Sharing your love for pets and their wellbeing, we at Bruno\'s Kitchen have crafted a service that brings balanced, freshly-prepared pet food right to your doorstep. Our simple yet nutritious recipes are scientifically formulated and made with utmost love, because we believe your furry friends deserve the very best.'),
              ),
              SizedBox(
                height: 20.h,
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (1 / 0.7)),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return foodCategoryGridChipWidget();
                },),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: black24w500Centre(data: 'Dive into a World of Paw-licking Goodness'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: black14w400Centre(data: 'Check out our delicious doggie dishes'),
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (1 / 1)),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return foodGridChipWidget();
                },),
              SizedBox(height:20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: customButton(text: 'Design Your Doggo\'s Delicious Diet Now', onPressed: () {  }, colored: true),
              ),
              SizedBox(height:40.h),
              black24w500Centre(data: 'Our Pawfect Process')
            ],
          ),
        ),
      ),
    );
  }
}
