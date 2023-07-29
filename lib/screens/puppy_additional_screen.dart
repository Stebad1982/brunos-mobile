import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../widgets/app_bar_with_back_widget.dart';

class PuppyAdditionalScreen extends StatelessWidget {
  const PuppyAdditionalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'My Puppy',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  dogFace,
                  height: 102.h,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                  child: black24w500Centre(data: 'Additional Information')),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: black14w400Centre(
                    data:
                    'In less than a minute, we’ll create a unique meal plan designed to meet your dog’s needs.'),
              ),
              SizedBox(
                height: 30.h,
              ),
              black18w500(data: 'Which Breed type is Labby?'),
              SizedBox(
                height: 8.h,
              ),
              black14w400Centre(data: 'Currently serving 300+ breeds and counting.'),
              SizedBox(
                height: 19.h,
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: CustomColors.lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    black14w400Centre(data: 'Aidi'),
                    Icon(Icons.keyboard_arrow_down)
                  ],),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: CustomColors.lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add),
                      black14w400Centre(data: 'Add Another Breed'),
                    ],),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              orange14w400(data: 'If Labby is a mixed breed'),
              SizedBox(
                height: 40.h,
              ),
              black18w500(data: 'When is Labby birthday?'),
              SizedBox(
                height: 19.h,
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: CustomColors.lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: black14w400Centre(data: 'MM   /   DD   /   YYYY')),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              black18w500(data: 'How much does Labby weight?'),
              SizedBox(
                height: 9.h,
              ),
              black14w400Centre(data: 'Not Sure? Give us your best guess.'),
              SizedBox(
                height: 18.h,
              ),
              black14w400Centre(data: 'Current Weight'),
              SizedBox(
                height: 12.h,
              ),
              TextField(
                //controller: nameController,
                onChanged: (text) {},
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0), hintText: 'Weight'),
              ),
              SizedBox(
                height: 20.h,
              ),
              black14w400Centre(data: 'Ideal Weight'),
              TextField(
                //controller: nameController,
                onChanged: (text) {},
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0), hintText: 'Weight'),
              ),
              SizedBox(
                height: 40.h,
              ),
              black18w500(data: 'Activity Level ?'),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: customSquareButton(
                        text: 'Active',
                        onPressed: () {
                          // Navigator.pushNamed(context, otpRoute);
                        },
                        colored: false),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: customSquareButton(
                        text: 'Very Active',
                        onPressed: () {
                          // Navigator.pushNamed(context, otpRoute);
                        },
                        colored: true),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: customSquareButton(
                        text: 'Less Active',
                        onPressed: () {
                          // Navigator.pushNamed(context, otpRoute);
                        },
                        colored: false),
                  )
                ],
              ),
              SizedBox(height: 40.h,),
              customButton(
                  text: 'Save',
                  onPressed: () {
                    Navigator.pushNamed(context, puppyConfirmationRoute);
                  },
                  colored: true),
            ],
          ),
        ),
      ),
    );
  }
}
