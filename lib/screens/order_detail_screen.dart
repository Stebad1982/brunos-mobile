import 'package:brunos_kitchen/view_models/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/cart_vertical_list_chip_widget.dart';
import '../widgets/order_items_vertical_list_chip_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderViewModel>(builder: (context, orderViewModel, child) {
      return Scaffold(
          appBar: const AppBarWithBackWidget(
              heading: 'Order Detail', showPuppy: false, showCart: false
          ),
          body: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: CustomColors.orangeColorTint,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            grey14w400(data: 'Order number'),
                            SizedBox(
                              width: 2.w,
                            ),
                            lightBlack14w400Centre(data: orderViewModel.getSelectedOrder.sId!.substring(orderViewModel.getSelectedOrder.sId!.length - 5)),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            grey14w400(data: 'Delivery Date'),
                            SizedBox(
                              width: 2.w,
                            ),
                            lightBlack14w400Centre(data: '${orderViewModel.getSelectedOrder.deliveryDate}'),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            grey14w400(data: 'Order total'),
                            SizedBox(
                              width: 2.w,
                            ),
                            lightBlack14w400Centre(data: 'AED ${orderViewModel.getSelectedOrder.cartTotal}'),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            grey14w400(data: 'Shipping Fee'),
                            SizedBox(
                              width: 2.w,
                            ),
                            lightBlack14w400Centre(data: 'AED ${orderViewModel.getSelectedOrder.shippingFees}'),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            grey14w400(data: 'Amount paid'),
                            SizedBox(
                              width: 2.w,
                            ),
                            lightBlack14w400Centre(data: 'AED ${orderViewModel.getSelectedOrder.totalAmount}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: orderViewModel.getSelectedOrder.orderItems!.length,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 120),
                itemBuilder: (BuildContext context, int index) {
                  return orderItemsVerticalListChipWidget(
                      itemIndex: index,
                      orderItems: orderViewModel.getSelectedOrder
                          .orderItems![index]);
                },
              ),
            ],
          ),
      );
    });
  }
}
