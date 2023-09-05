import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/puppy_view_model.dart';
import 'circular_network_image_widget.dart';

Widget cartIconWidget() {
  return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
    return InkWell(
      onTap: () {},
      child:  SizedBox(
        height: 30.h,
        width: 30.h,
        child: CircleAvatar(
          backgroundColor: CustomColors.purpleColorTint,
          child: SizedBox(
              height: 20.h,
              width: 20.h,
              child: SvgPicture.asset(shoppingBagIcon,color: CustomColors.whiteColor,)),
        ),
      ),
    );
  });
}
