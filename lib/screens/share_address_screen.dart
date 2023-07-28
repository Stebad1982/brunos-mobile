import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../widgets/back_button_widget.dart';

class ShareAddressScreen extends StatelessWidget {
  const ShareAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonWidget(),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    black24w500Centre(data: 'Share Your Address With Us'),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                        width: 309.w,
                        child: black14w400Centre(
                            data:
                            'Please enter your location or allow access to your location to find food near you')),
                    SizedBox(
                      height: 40.h,
                    ),
                    Image.asset(
                      circularMap,
                      width: 250.w,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  customButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            bottomNavigationRoute,
                            ModalRoute.withName(splashRoute));
                      },
                      colored: true),
                  SizedBox(
                    height: 32.h,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, addAddressRoute);
                      },
                      child: orange14w500(data: 'Enter Manually'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
