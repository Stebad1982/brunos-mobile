import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/responses/order_response.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/order_model.dart';
import '../../route_generator.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/custom_colors.dart';
import '../../utils/date_time_formatter.dart';
import '../../utils/images.dart';
import '../dialogs/address_label_dialog.dart';
import '../dialogs/cancel_order_dialog.dart';

Widget ordersVerticalListChipWidget(
    {required bool showButtons, required OrderData orderListData}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          navigatorKey.currentContext!
              .read<OrderViewModel>()
              .setSelectedOrder(orderListData);
          Navigator.pushNamed(navigatorKey.currentContext!, orderDetailRoute);
        },
        child: Container(
          decoration: ShapeDecoration(
            color: CustomColors.lightGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    lightBlack14w400Centre(
                        data:
                            'Order Number: ${orderListData.sId!.substring(orderListData.sId!.length - 5)}'),

                   /* Visibility(
                      visible:*/ orderListData.isCompleted!?
                     orange14w500(data: 'Delivered'): orange14w500(data: 'Preparing')/*)*/,
                  ],
                ),
                grey14w400(
                    data: 'Order Date: ${DateTimeFormatter.timeStampToDate(orderListData.createdOnDate!,2)}'),
                SizedBox(
                  height: 14.h,
                ),
                black16w500(data: 'AED ${orderListData.totalAmount}'),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                  visible: showButtons,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10).w,
                    child: SizedBox(
                      width: 270.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: customSquareButton(
                                text: 'Cancel',
                                onPressed: () {
                                  cancelOrderDialog(
                                      context:
                                          navigatorKey.currentContext!);
                                },
                                colored: true),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: customSquareButton(
                                text: 'Freeze ',
                                onPressed: () {},
                                colored: true),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: customSquareButton(
                                text: 'Update It',
                                onPressed: () {},
                                colored: true),
                          )
                        ],
                      ),
                    ),
                  ),
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
