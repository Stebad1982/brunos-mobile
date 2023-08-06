import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/enums.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/google_facebook_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                      black24w500Centre(data: 'Welcome back Dog Lovers'),
                      SizedBox(
                        height: 10.h,
                      ),
                      grey14w400(data: 'Please enter your login details below'),
                      SizedBox(
                        height: 32.h,
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
                      SizedBox(height: 5.h,),
                      Visibility(
                        visible: authViewModel.getEmailFieldError.isNotEmpty,
                          child: orange14w400(data: authViewModel.getEmailFieldError)),
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
                      Visibility(
                          visible: authViewModel.getPasswordFieldError.isNotEmpty,
                          child: orange14w400(data: authViewModel.getPasswordFieldError)),
                      SizedBox(
                        height: 12.h,
                      ),
                      InkWell(
                        onTap: (){
                          authViewModel.clearFieldsData();
                          context.read<AuthViewModel>().setOtpRouteFrom(Screens.forgetPassword.text);
                          Navigator.pushNamed(context, forgetPasswordRoute);
                        },
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: orange14w400(data: 'Forgot Password')),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      customButton(text: 'Login', onPressed: () {
                            if (authViewModel.signInValidation()) {
                              authViewModel.callSignInApi().then((value) => {
                                    if (value)
                                      {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            bottomNavigationRoute,
                                            ModalRoute.withName(splashRoute))
                                      }
                                  });
                            }
                          }, colored: true),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(child: grey14w400(data: 'Or continue with')),
                      SizedBox(
                        height: 20.h,
                      ),
                      googleFacebookButtonWidget(),
                      SizedBox(
                        height: 40.h,
                      ),
                      customButton(text: 'Continue As Guest', onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            bottomNavigationRoute,
                            ModalRoute.withName(splashRoute));
                      }, colored: false),


                    ],
                  ),
                  SizedBox(
                    height: screenHeight,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: (){
                          authViewModel.clearFieldsData();
                          authViewModel.setOtpRouteFrom(Screens.registerUser.text);
                          Navigator.pushNamed(context, registerUserRoute);
                        },
                        child: const Text.rich(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
