import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/card_model.dart';
import 'package:brunos_kitchen/models/responses/puppies_response.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:brunos_kitchen/view_models/puppy_view_model.dart';
import 'package:brunos_kitchen/widgets/circular_network_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/puppy_model.dart';
import '../route_generator.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../view_models/bottom_navigation_view_model.dart';

Widget cardVerticalListChipWidget({required CardModel cardDetail}) {
  return Column(
    children: [
      InkWell(
        onTap: () {

        },
        child: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: CustomColors.lightGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: black10w400(data: cardDetail.cardPM!),
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
