import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_colors.dart';

Future recipeDetailBottomSheetWidget() {
  return showModalBottomSheet(
      isScrollControlled: false,
      backgroundColor: CustomColors.whiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: navigatorKey.currentContext!,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          black18w500(data: 'Barkin Beef'),
                          SizedBox(
                            height: 5.h,
                          ),
                          grey14w400(data: 'See all the ingredients in the food'),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
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
                          height: 900.h,
                          //I want to use dynamic height instead of fixed height
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: TabBarView(
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      black12w500Centre(
                                          data:
                                              'Give your furry friend a taste of the good life with the Pedigree Complete Nutrition Grilled Steak & Vegetable Flavor Dog Kibble Adult Dry Dog Food. With a succulent steak flavor accented with hearty vegetables, this food has everything you need to keep your dog feeling his best. It’s prepared with whole grains for healthy digestion, plus essential nutrients and omega-6 fatty acids to promote a healthy skin and luxurious coat. And perhaps best of all, the crunchy texture of the kibble helps clean his teeth, so he’s always ready for his close up. It’s the easy way to combine great-tasting food plus nutrition that promotes health and vitality into a single bowl.'),
                                      SizedBox(
                                        height: 27.h,
                                      )
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      black12w500Centre(
                                          data:
                                              'Ground Whole Grain Corn, Meat And Bone Meal, Corn Gluten Meal, Animal Fat (Source Of Omega 6 Fatty Acids [Preserved With Bha & Citric Acid]), Soybean Meal, Natural Flavor, Chicken By-Product Meal, Dried Plain Beet Pulp, Salt, Potassium Chloride, Brewers Rice, Ground Whole Grain Wheat, Choline Chloride, Calcium Carbonate, Dried Peas, Dl-Methionine'),
                                      SizedBox(
                                        height: 27.h,
                                      )
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      black12w500Centre(
                                          data:
                                              'Mix with the present diet by one-quarter to three quarters to begin with (25% new to 75% old). Follow by a daily increase in the amount of the new product until your pet is eating only the new. This gradual approach, taken over a week\'s time, is usually more acceptable and avoids any digestive upsets a sudden change in diet may cause to your pet.'),
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
            ],
          ),
        );
      });
}
