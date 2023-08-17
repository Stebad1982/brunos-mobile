import 'package:brunos_kitchen/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import 'circular_network_image_widget.dart';

Widget defaultPuppyIconWidget() {
  return Row(
    children: [
      navigatorKey.currentContext!
          .watch<AuthViewModel>()
          .getAuthResponse
          .data!
          .pet != null &&
      navigatorKey.currentContext!
              .watch<AuthViewModel>()
              .getAuthResponse
              .data!
              .pet!
              .media!
              .isNotEmpty
          ? circularNetworkImageWidget(
              image: navigatorKey.currentContext!
                  .watch<AuthViewModel>()
                  .getAuthResponse
                  .data!
                  .pet!
                  .media!,
              size: 40.h)
          : SizedBox(
              height: 40.h,
              width: 40.h,
              child: CircleAvatar(
                backgroundColor: CustomColors.yellowColor,
                child: SvgPicture.asset(dogFace),
              ),
            ),
    ],
  );
}
