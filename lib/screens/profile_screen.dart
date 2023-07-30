import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import '../view_models/puppy_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, editProfileRoute);
                },
                child: Row(
                  children: [
                    Image.asset(
                      profileImage,
                      height: 58.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          black14w400Centre(data: 'Hi, Sepide'),
                          SizedBox(
                            height: 10.h,
                          ),
                          grey14w400(data: 'Sepide@piqo.design')
                        ],
                      ),
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: CustomColors.greyColor,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 39.h,
              ),
              black14w400Centre(data: 'Account'),
              SizedBox(
                height: 14.h,
              ),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, ordersRoute);
                },
                  leading: SvgPicture.asset(
                    orderIcon,
                    height: 24.h,
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: black14w400Centre(data: 'Orders')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                onTap: (){
                  context.read<PuppyViewModel>().setRouteToPuppyFrom(Screens.profile.text);
                  Navigator.pushNamed(context, puppyRoute);
                },
                  leading: SvgPicture.asset(
                    orderIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: black14w400Centre(data: 'My Puppy')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  leading: SvgPicture.asset(
                    payCardIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: black14w400Centre(data: 'Payment')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, addressRoute);
                },
                  leading: SvgPicture.asset(
                    mapPin,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: black14w400Centre(data: 'Shipping Address')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              SizedBox(
                height: 50.h,
              ),
              black14w400Centre(data: 'Help & Support'),
              SizedBox(
                height: 14.h,
              ),
              ListTile(
                  leading: SvgPicture.asset(
                    helpIcon,
                    height: 24.h,
                  ),
                  shape: const Border(
                    bottom: BorderSide(color: CustomColors.greyMediumColor),
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: black14w400Centre(data: 'Get Help')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              ListTile(
                  leading: SvgPicture.asset(
                    faqIcon,
                    height: 24.h,
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: black14w400Centre(data: 'FAQ')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: CustomColors.greyColor,
                  )),
              SizedBox(height: 32.h,),
              ListTile(
                  leading: SvgPicture.asset(
                    logoutIcon,
                    height: 24.h,
                  ),
                  title: Align(
                      alignment: Alignment.centerLeft,
                      child: orange14w400(data: 'Log out')),
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
