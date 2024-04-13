/*
import 'package:brunos_kitchen/view_models/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/listChips/orders_vertical_list_chip_widget.dart';

class OrderInProcessScreen extends StatelessWidget {
  const OrderInProcessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderViewModel>(builder: (_, orderViewModel, __) {
      return ListView.builder(
        itemCount: orderViewModel.getInProcessOrders.length,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        itemBuilder: (BuildContext context, int index) {
          return ordersVerticalListChipWidget(
              showButtons: false,
              orderListData: orderViewModel.getInProcessOrders[index]);
        },
      );
    });
  }
}
*/
