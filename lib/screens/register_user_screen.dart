import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/google_facebook_button_widget.dart';

class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
            child: Stack(
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                black24w500Centre(data: 'Let’s get started!'),
                SizedBox(
                  height: 10.h,
                ),
                grey14w400(
                    data: 'Tell us a bit about you and your pawsome friend'),
                SizedBox(
                  height: 32.h,
                ),
                TextField(
                  controller: authViewModel.getNameController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: 'Full name',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(userIcon),
                      )),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextField(
                  controller: authViewModel.getEmailController,
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
                  controller: authViewModel.getPhoneController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(phoneIcon),
                              SizedBox(width: 5.w,),
                              grey14w400(data: '+1'),
                              SizedBox(width: 5.w,),
                              const VerticalDivider(
                                color: CustomColors.greyColor,
                                thickness: 1,
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextField(
                  controller: authViewModel.getPasswordController,
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
            height: 16.h,
          ),
          TextField(
            controller: authViewModel.getConfirmPasswordController,
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
                  height: 40.h,
                ),
                customButton(text: 'Continue', onPressed: () {
                  Navigator.pushNamed(context, registerUserContinueRoute);
                }, colored: true),
                SizedBox(
                  height: 20.h,
                ),
                Center(child: grey14w400(data: 'Or continue with')),
                SizedBox(
                  height: 20.h,
                ),
                googleFacebookButtonWidget(),
              ],
            ),
            SizedBox(height: screenHeight,
                child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                onTap: (){
            Navigator.pop(context);
            },
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already Have Account? ',
                    style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 16,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Log In',
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
      ),
      ],
    )
    ,
    ),
        )
    ,
    )
    ,
    );});
  }
}
