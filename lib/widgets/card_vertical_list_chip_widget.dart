
import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/card_model.dart';
import 'package:brunos_kitchen/models/responses/puppies_response.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:brunos_kitchen/view_models/card_view_model.dart';
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
import 'dialogs/delete_card_confirmation_dialog.dart';
import 'dialogs/delete_pet_confirmation_dialog.dart';

Widget cardVerticalListChipWidget({required CardModel cardDetail}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          navigatorKey.currentContext!.read<AuthViewModel>().setCard(cardDetail);
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    orange18w500(data: cardDetail.brand!),
                    SizedBox(
                      height: 5.h,
                    ),
                    grey12w500(data: '**** **** **** ${cardDetail.last4}'),
                    SizedBox(
                      height: 5.h,
                    ),
                    grey12w500(
                        data:
                            'Expiry: ${cardDetail.expMonth}/${cardDetail.expYear}'),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Visibility(
                      visible: cardDetail.isDefault!,
                      child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color: CustomColors.orangeColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 2),
                            child: white12w400(data: 'Default'),
                          )),
                    ),
                    SizedBox(height: 10.h,),
                    InkWell(
                      onTap: () async {
                        navigatorKey.currentContext!.read<CardViewModel>().setIsCardAdd(false);
                        navigatorKey.currentContext!.read<CardViewModel>().setCardDetailData(cardDetail);
                        Navigator.pushNamed(navigatorKey.currentContext!, addCardRoute);
                      //  deleteCardConfirmationDialog(context: navigatorKey.currentContext!, cardId: cardDetail.sId!, );
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          color: CustomColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.75, color: CustomColors.greyMediumColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.delete_outline,
                            size: 20,
                            color: CustomColors.orangeColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
