import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../route_generator.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/custom_colors.dart';
import '../../utils/custom_font_style.dart';
import '../../utils/images.dart';

void homePromoDialog(
    {required BuildContext context}) {
  Timer? timer = Timer(const Duration(milliseconds: 10000), (){
    Navigator.of(context, rootNavigator: true).pop();
  });
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
/*
    transitionDuration: const Duration(milliseconds: 500),
*/
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 450.h,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(40)),
          child: Stack(

            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.cancel,color: CustomColors.blackColor,size: 30.h,))),
              SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          splashBackground,
                        //  width: 150.w,
                          height: 400.h,
                         // fit: BoxFit.fitWidth,
                        ),
                      //  const Spacer(),
                       // black18w500(data: 'Share Your Address With Us'),
                     //   const Spacer(),
                        /*customButton(
                          height: 40,
                          colored: true,
                          text: 'Continue',
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, addAddressRoute);
                          },
                        ),
                        const Spacer(),*/
                       /* customButton(
                          height: 40,
                          colored: false,
                          text: 'Not now',
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),*/
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    },
  ).then((value) {
    timer!.cancel();
    timer = null;
  });
}