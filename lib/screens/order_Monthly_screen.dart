import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../view_models/order_view_model.dart';
import '../widgets/listChips/order_items_vertical_list_chip_widget.dart';
import '../widgets/listChips/orders_vertical_list_chip_widget.dart';

class OrderMonthlyScreen extends StatelessWidget {
  const OrderMonthlyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderViewModel>(builder: (_, orderViewModel, __) {
/*
      return Container();
*/
     return ListView.builder(
        itemCount: orderViewModel.getMonthlyOrders.length,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        itemBuilder: (BuildContext context, int index) {
          return orderItemsVerticalListChipWidget(
              itemIndex: index,
              orderItems: orderViewModel.getMonthlyOrders[index],showButtons: true);
        },
      );
    });
  }
}
