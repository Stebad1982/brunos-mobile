import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../widgets/back_button_widget.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  bool _switchValue = true;

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
                const BackButtonWidget(),
                SizedBox(
                  height: 26.h,
                ),
                Center(child: black24w500Centre(data: 'add Address')),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: black14w400Centre(
                      data:
                      'Add you address details below'),
                ),
                SizedBox(
                  height: 40.h,
                ),
                TextField(
                  //controller: nameController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      hintText: 'Address',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(mapPin),
                      )),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //controller: nameController,
                        onChanged: (text) {},
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Street',),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Expanded(
                      child: TextField(
                        //controller: nameController,
                        onChanged: (text) {},
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Area',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //controller: nameController,
                        onChanged: (text) {},
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'City',),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Expanded(
                      child: TextField(
                        //controller: nameController,
                        onChanged: (text) {},
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Floor/Unit#',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    black14w500(data: 'Set default address'),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeColor: CustomColors.orangeColor,
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                black18w500(data: 'Add a label'),
                SizedBox(
                  height: 23.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          homeAddressIcon,
                          width: 48.w,
                        ),
                        black14w400Centre(data: 'Home'),

                      ],
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          workAddressIcon,
                          width: 48.w,
                        ),
                        black14w400Centre(data: 'Work'),
                      ],
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          partnerAddressIcon,
                          width: 48.w,
                        ),
                        black14w400Centre(data: 'Partner'),

                      ],
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          otherAddressIcon,
                          width: 48.w,
                        ),
                        black14w400Centre(data: 'Other'),

                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                customButton(
                    text: 'Add',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          bottomNavigationRoute,
                          ModalRoute.withName(splashRoute));
                    },
                    colored: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


