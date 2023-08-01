import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../widgets/back_button_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonWidget(),
              SizedBox(
                height: 35.h,
              ),
              black24w500Centre(data: 'Reset Password'),
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
                //controller: nameController,
                onChanged: (text) {},
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: 'New Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(lockIcon),
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
                    hintText: 'Re-Enter New Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(lockIcon),
                    )),
              ),
              SizedBox(
                height: 40.h,
              ),
              customButton(text: 'Continue', onPressed: () {
                Navigator.pushNamed(context, resetPasswordSuccessRoute);
              }, colored: true),
            ],
          ),
        ),
      ),
    );
  }
}
