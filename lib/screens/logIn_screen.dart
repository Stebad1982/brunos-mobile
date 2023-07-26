import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/custom_buttons.dart';
import '../utils/images.dart';
import '../widgets/google_facebook_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                black24w500Centre(data: 'Welcome back Dog Lovers'),
                SizedBox(
                  height: 10.h,
                ),
                grey14w400(data: 'Please enter your login details below'),
                SizedBox(
                  height: 32.h,
                ),
                TextField(
                  //controller: nameController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email address',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(emailIcon),
                      )),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextField(
                  //controller: nameController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(lockIcon),
                      )),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: orange14w400(data: 'Forgot Password')),
                SizedBox(
                  height: 40.h,
                ),
                customButton(text: 'Continue', onPressed: () {}, colored: true),
                SizedBox(
                  height: 20.h,
                ),
                Center(child: grey14w400(data: 'Or continue with')),
                SizedBox(
                  height: 20.h,
                ),
                googleFacebookButtonWidget(),

                SizedBox(
                  height: 236.h,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, registerUserRoute);
                  },
                  child: const Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t Have Account? ',
                            style: TextStyle(
                              color: CustomColors.blackColor,
                              fontSize: 16,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: CustomColors.orangeColor,
                              fontSize: 16,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
