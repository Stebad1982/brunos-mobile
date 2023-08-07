import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return TextField(
        controller: authViewModel.getPhoneController,
        onChanged: (text) {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Phone Number',
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(phoneIcon),
                    CountryCodePicker(
                      padding: EdgeInsets.zero,
                      showFlagMain: false,
                      onChanged: (value) => {
                        authViewModel.setCountryCode(value.toString())
                      },
                      initialSelection: authViewModel.getCountryCode,
                      favorite: const ['+971', 'UAE'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      textStyle: TextStyle(
                        fontFamily: 'CircularStd',
                        fontSize: 14.sp,
                        color: CustomColors.greyColor,
                      ),
                    ),
                    const VerticalDivider(
                      color: CustomColors.greyColor,
                      thickness: 1,
                    )
                  ],
                ),
              ),
            )),
      );
    });
  }
}

class NameFieldWidget extends StatelessWidget {
  const NameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return TextField(
        controller: authViewModel.getNameController,
        onChanged: (text) {},
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            hintText: 'Full name',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(userIcon),
            )),
      );
    });
  }
}

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return TextField(
        controller: authViewModel.getEmailController,
        onChanged: (text) {},
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email address',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(emailIcon),
            )),
      );
    });
  }
}

class PasswordFieldWidget extends StatelessWidget {
  final String hint;
  const PasswordFieldWidget({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return TextField(
        controller: authViewModel.getPasswordController,
        onChanged: (text) {},
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(lockIcon),
            )),
      );
    });
  }
}

class ConfirmPasswordFieldWidget extends StatelessWidget {
  final String hint;
  const ConfirmPasswordFieldWidget({Key? key,required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return TextField(
        controller: authViewModel.getConfirmPasswordController,
        onChanged: (text) {},
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(lockIcon),
            )),
      );
    });
  }
}
