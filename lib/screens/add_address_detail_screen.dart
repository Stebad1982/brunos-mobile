import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
import '../view_models/address_view_model.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/back_button_widget.dart';
import '../widgets/dialogs/address_label_dialog.dart';

class AddAddressDetailScreen extends StatefulWidget {
  const AddAddressDetailScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressDetailScreen> createState() => _AddAddressDetailScreenState();
}

class _AddAddressDetailScreenState extends State<AddAddressDetailScreen> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressViewModel>(
        builder: (context, addressViewModel, child) {
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
                    const BackButtonWidget(),
                    SizedBox(
                      height: 26.h,
                    ),
                    Center(child: black24w500Centre(data: 'Add Address')),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: lightBlack14w400Centre(
                          data:
                          'Add you address details below'),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    TextField(
                      enabled: false,
                      controller: addressViewModel.getNearByLocationController,
                      onChanged: (text) {},
                      //keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                          //hintText: 'Address',
                          prefixIcon: SvgPicture.asset(mapPin,height: 5, width: 5,
                              fit: BoxFit.scaleDown),
                      ),
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
                            value: addressViewModel.getIsDefault,
                            onChanged: (value) {
                              addressViewModel.setIsDefault(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,),
                      black18w500(data: 'Add Label'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              //   addressViewModel.callLocation(context);
                              addressViewModel.setSelectedLabel(AddressLabels.home.text);
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                    addressViewModel.getSelectedLabel == AddressLabels.home.text
                                        ? CustomColors.orangeColor
                                        : CustomColors.whiteColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: CustomColors.orangeColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      homeAddressIcon,
                                      width: 24.w,
                                      color:
                                      addressViewModel.getSelectedLabel ==
                                          AddressLabels.home.text
                                          ? CustomColors.whiteColor
                                          : CustomColors.orangeColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                addressViewModel.getSelectedLabel == AddressLabels.home.text
                                    ? orange14w400(data: 'Home')
                                    : lightBlack14w400Centre(data: 'Home'),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          InkWell(
                            onTap: () {
                              //   addressViewModel.callLocation(context);
                              addressViewModel.setSelectedLabel(AddressLabels.work.text);
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                    addressViewModel.getSelectedLabel == AddressLabels.work.text
                                        ? CustomColors.orangeColor
                                        : CustomColors.whiteColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: CustomColors.orangeColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      workAddressIcon,
                                      width: 24.w,
                                      color:
                                      addressViewModel.getSelectedLabel ==
                                          AddressLabels.work.text
                                          ? CustomColors.whiteColor
                                          : CustomColors.orangeColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                addressViewModel.getSelectedLabel == AddressLabels.work.text
                                    ? orange14w400(data: 'Work')
                                    : lightBlack14w400Centre(data: 'Work'),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          InkWell(
                            onTap: () {
                              //   addressViewModel.callLocation(context);
                              addressViewModel.setSelectedLabel(AddressLabels.partner.text);
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                    addressViewModel.getSelectedLabel == AddressLabels.partner.text
                                        ? CustomColors.orangeColor
                                        : CustomColors.whiteColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: CustomColors.orangeColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      partnerAddressIcon,
                                      width: 24.w,
                                      color:
                                      addressViewModel.getSelectedLabel ==
                                          AddressLabels.partner.text
                                          ? CustomColors.whiteColor
                                          : CustomColors.orangeColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                addressViewModel.getSelectedLabel == AddressLabels.partner.text
                                    ? orange14w400(data: 'Partner')
                                    : lightBlack14w400Centre(data: 'Partner'),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          InkWell(
                            onTap: () {
                              //   addressViewModel.callLocation(context);
                              addressLabelDialog(context: context);
                              addressViewModel.setSelectedLabel(AddressLabels.other.text);
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                    addressViewModel.getSelectedLabel == AddressLabels.other.text
                                        ? CustomColors.orangeColor
                                        : CustomColors.whiteColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: CustomColors.orangeColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      otherAddressIcon,
                                      width: 24.w,
                                      color:
                                      addressViewModel.getSelectedLabel ==
                                          AddressLabels.other.text
                                          ? CustomColors.whiteColor
                                          : CustomColors.orangeColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                addressViewModel.getSelectedLabel == AddressLabels.other.text
                                    ? orange14w400(data: addressViewModel.getOtherLabel)
                                    : lightBlack14w400Centre(data: addressViewModel.getOtherLabel),
                              ],
                            ),
                          ),
                        ],
                      ),


                  ],
                ),
                SizedBox(
                  height: screenHeight,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: customButton(
                        text: 'Add',
                        onPressed: () async {
                          await addressViewModel
                              .callCreateAddressApi()
                              .then((value) {
                            Navigator.pop(context);
                            context
                                .read<AuthViewModel>()
                                .callSplash(showLoader: true);
/*
                                      if (value) {
                                        context
                                            .read<AuthViewModel>()
                                            .setSelectedAddress(addressViewModel
                                                .getAllAddressResponse
                                                .data!
                                                .defaultAddress!);
                                      }
*/
                          });
                          /*Navigator.pushNamedAndRemoveUntil(
                              context,
                              bottomNavigationRoute,
                              ModalRoute.withName(splashRoute));*/
                        },
                        colored: true),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );});
  }
}


