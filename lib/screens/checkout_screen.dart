import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../widgets/app_bar_with_back_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'Transitional Plan',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 220),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Image.asset(
                      buyBulits3,
                      height: 57.h,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  black24w500Centre(data: 'Checkout'),
                  SizedBox(
                    height: 10.h,
                  ),
                  black14w400Centre(
                      data:
                          'You’re just two clicks away to serve up the finest meals tailored for your fluffy companion\'s ultimate joy'),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50,
                            color: CustomColors.greyMediumLightColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                mapPin,
                                color: CustomColors.orangeColor,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              black14w400Centre(data: 'Delivery Address'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  black18w500(data: 'Mina Jebel Ali'),
                                  black14w400Centre(data: 'Dubai - UAE')
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, addressRoute);
                                },
                                child: Container(
                                  decoration: ShapeDecoration(
                                    color: CustomColors.whiteColor,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.75,
                                          color: CustomColors.greyMediumColor),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: CustomColors.orangeColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 0.50,
                            color: CustomColors.greyMediumLightColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(payCardIcon),
                          SizedBox(
                            width: 2.w,
                          ),
                          black14w400Centre(data: 'Payment method'),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: CustomColors.greyColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50,
                            color: CustomColors.greyMediumLightColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          black18w500(data: 'Order Summary'),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              black14w400Centre(data: 'Subtotal'),
                              SizedBox(
                                width: 2.w,
                              ),
                              black14w400Centre(data: 'AED 100'),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              black14w400Centre(data: 'Shipping Fee'),
                              SizedBox(
                                width: 2.w,
                              ),
                              black14w400Centre(data: '10 AED (One time  Fee)'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50,
                            color: CustomColors.greyMediumLightColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            couponCoin,
                            height: 40.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              black12w500Centre(
                                  data: 'Your accumulated Paw Points'),
                              black16w500(data: '64468'),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: CustomColors.greyColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50,
                            color: CustomColors.greyMediumLightColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          black18w500(data: 'Enter your Promo code here'),
                          SizedBox(
                            height: 17.h,
                          ),
                          black14w400Centre(
                              left: true,
                              data:
                                  'You can only use your PawPoints or a Promo Code per transaction. Promo codes are one-time use only.'),
                          SizedBox(
                            height: 17.h,
                          ),
                          Row(
                            children: [
                              black14w400Centre(data: 'Generate coupon code'),
                              Spacer(),
                              yellow10w500(data: 'HOW IT WORKS?'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              color: CustomColors.greyMediumLightColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(couponIcon),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  black14w400Centre(data: 'ME432DW'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              color: CustomColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.50,
                                    color: CustomColors.greyMediumLightColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child:
                                  black14w400Centre(data: 'Apply coupon code'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: CustomColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 2,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        black14w400Centre(data: 'Total'),
                        const Spacer(),
                        black16w500(data: 'AED 95')
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        black14w400Centre(data: 'Points Rewarded Amount'),
                        const Spacer(),
                        black16w500(data: '5')
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    customButton(
                        text: 'Place Order',
                        onPressed: () {
                          Navigator.pushNamed(context, orderConfirmationRoute);
                        },
                        colored: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
