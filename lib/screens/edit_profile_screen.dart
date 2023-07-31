import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/widgets/app_bar_with_back_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';
import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(heading: 'Edit Profile',),
      body: SingleChildScrollView(
        child: Padding(
         padding: const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    //controller: nameController,
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
                ],
              ),
              SizedBox(
                height: screenHeightWithAppBar,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: customButton(text: 'Save', onPressed: () {
                    Navigator.pop(context);
                  }, colored: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
