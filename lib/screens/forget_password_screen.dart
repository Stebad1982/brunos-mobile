import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/images.dart';
import '../widgets/back_button_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __)
    {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30, bottom: 30, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonWidget(),
                SizedBox(
                  height: 35.h,
                ),
                black24w500Centre(data: 'Forget Password'),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 286.w,
                  child: grey14w400(
                      data:
                      'We will send you an confirmation code to your phone for password reset'),
                ),
                SizedBox(
                  height: 32.h,
                ),
                TextField(
                  controller: authViewModel
                      .getPhoneController,
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
                              grey14w400(data: authViewModel
                                  .getCountryCode),
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
                SizedBox(height: 5.h,),
                Visibility(
                    visible: authViewModel.getPhoneFieldError.isNotEmpty,
                    child: orange14w400(
                        data: authViewModel.getPhoneFieldError)),
                SizedBox(
                  height: 40.h,
                ),
                customButton(text: 'Continue', onPressed: () {
                  if (authViewModel.phoneValidation()) {
                    authViewModel.verifyNumber();
                    Navigator.pushNamed(context, otpRoute);
                  }
                }, colored: true),
              ],
            ),
          ),
        ),
      );
    });  }
}
