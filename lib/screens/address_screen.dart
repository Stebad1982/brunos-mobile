import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../view_models/address_view_model.dart';
import '../widgets/address_vertical_list_chip_widget.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/puppy_vertical_list_chip_widget.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressViewModel>(
        builder: (context, addressViewModel, child) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'Address',
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.orangeColor,
        onPressed: () {
          addressViewModel.setIsAddressAdd(true);
          Navigator.pushNamed(context, addAddressRoute2);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        itemBuilder: (BuildContext context, int index) {
          return addressVerticalListChipWidget();
        },
      ),
    );});
  }
}
