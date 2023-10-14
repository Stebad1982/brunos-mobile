import 'package:brunos_kitchen/view_models/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          body: ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderViewModel.getSelectedOrder.orderItems!.length,
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 20, bottom: 120),
            itemBuilder: (BuildContext context, int index) {
              return orderItemsVerticalListChipWidget(
                  itemIndex: index,
                  orderItems: orderViewModel.getSelectedOrder
                      .orderItems![index]);
            },
          ),
      );
    });
  }
}
