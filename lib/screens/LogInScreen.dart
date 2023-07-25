import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 20,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              black24w500(data: 'Welcome back Dog Lovers'),
              SizedBox(height: 10.h,),
              grey14w400(data: 'Please enter your login details below'),
              SizedBox(height: 32.h,),
              TextField(
                  //controller: nameController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email address',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(emailIcon),
                    )
                ),
                  ),
              SizedBox(height: 16.h,),
              TextField(
                //controller: nameController,
                onChanged: (text) {},
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(lockIcon),
                    )
                ),
              ),
              SizedBox(height: 12.h,),
              Align(
                alignment: Alignment.centerRight,
                  child: orange14w400(data: 'Forgot Password'))
            ],
          ),
        ),
      ),
    );
  }
}
