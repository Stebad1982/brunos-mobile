import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../route_generator.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/app_bar_with_back_widget.dart';
import '../../view_models/address_view_model.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressViewModel>(
        builder: (context, addressViewModel, child) {
      return Scaffold(
        backgroundColor: CustomColors.whiteColor,
        appBar: const AppBarWithBackWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addressViewModel.setIsAddressAdd(true);
            Navigator.pushNamed(context, addAddressRoute2);
          },
          child: const Icon(Icons.add),
        ),
        body:
        addressViewModel.getAllAddressResponse.data != null?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: black14w500(
                data: 'Manage_Address',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: black14w500(
                data: 'Default Address',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            addressViewModel.getAllAddressResponse.data!.defaultAddress == null
                ? SizedBox(
                    height: 100.h,
                    child: Center(
                        child: black14w500(data: 'No Default Address set Yet')))
                : GestureDetector(
                    onTap: () async {
                      /* if (!addressViewModel.getRoutFromSettings) {
                  context.read<AuthViewModel>().setSelectedAddress(
                      addressViewModel
                          .getAllAddressResponse.data!.defaultAddress);
                  Navigator.pop(context);
                }*/
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Card(
                          elevation: 5,
                          color: CustomColors.orangeColor,
                          borderOnForeground: false,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                            side: const BorderSide(
                              color: CustomColors.purpleColor,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  addressViewModel.getAllAddressResponse.data!
                                              .defaultAddress!.addressType! ==
                                          1
                                      ? Icons.home
                                      : addressViewModel
                                                  .getAllAddressResponse
                                                  .data!
                                                  .defaultAddress!
                                                  .addressType! ==
                                              2
                                          ? Icons.corporate_fare_outlined
                                          : Icons.location_history,
                                  size: 20.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      black14w500(
                                          data: addressViewModel
                                                      .getAllAddressResponse
                                                      .data!
                                                      .defaultAddress!
                                                      .addressType! ==
                                                  1
                                              ? 'Home'
                                              : addressViewModel
                                                          .getAllAddressResponse
                                                          .data!
                                                          .defaultAddress!
                                                          .addressType! ==
                                                      2
                                                  ? 'Office'
                                                  : 'Others'),
                                      black14w500(
                                          data:
                                              'Flat/House Number: ${addressViewModel.getAllAddressResponse.data!.defaultAddress!.fullAddress}'),
                                      black14w500(
                                          data:
                                              'Location: ${addressViewModel.getAllAddressResponse.data!.defaultAddress!.nearbyLocations}'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                IconButton(
                                  onPressed: () {
                                    addressViewModel.setEditAddress(
                                        addressViewModel.getAllAddressResponse
                                            .data!.defaultAddress!);
                                    addressViewModel.setIsAddressAdd(false);
                                    Navigator.pushNamed(
                                        context, '/add_address');
                                  },
                                  icon: Icon(
                                    Icons.mode_edit_outlined,
                                    size: 20.h,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: black14w500(
                data: 'All Addresses',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            addressViewModel.getAllAddressResponse.data!.allAddresses!.isEmpty
                ? Expanded(
                    child: Center(child: black14w500(data: 'No Address Found')))
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 70.h),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: addressViewModel
                          .getAllAddressResponse.data!.allAddresses!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            /* if (!addressViewModel.getRoutFromSettings) {
                              context.read<AuthViewModel>().setSelectedAddress(
                                  addressViewModel.getAllAddressResponse.data!
                                      .allAddresses![index]);
                              Navigator.pop(context);
                            }*/
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Card(
                                elevation: 5,
                                color: CustomColors.orangeColor,
                                borderOnForeground: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0.r)),
                                  side: const BorderSide(
                                    color: CustomColors.purpleColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        addressViewModel
                                                    .getAllAddressResponse
                                                    .data!
                                                    .allAddresses![index]
                                                    .addressType! ==
                                                1
                                            ? Icons.home
                                            : addressViewModel
                                                        .getAllAddressResponse
                                                        .data!
                                                        .allAddresses![index]
                                                        .addressType! ==
                                                    2
                                                ? Icons.corporate_fare_outlined
                                                : Icons.location_history,
                                        size: 20.h,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            black14w500(
                                                data: addressViewModel
                                                            .getAllAddressResponse
                                                            .data!
                                                            .allAddresses![
                                                                index]
                                                            .addressType! ==
                                                        1
                                                    ? 'Home'
                                                    : addressViewModel
                                                                .getAllAddressResponse
                                                                .data!
                                                                .allAddresses![
                                                                    index]
                                                                .addressType! ==
                                                            2
                                                        ? 'Office'
                                                        : 'Others'),
                                            black14w500(
                                                data:
                                                    'Flat/House Number: ${addressViewModel.getAllAddressResponse.data!.allAddresses![index].fullAddress}'),
                                            black14w500(
                                                data:
                                                    'Location: ${addressViewModel.getAllAddressResponse.data!.allAddresses![index].nearbyLocations}'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          addressViewModel.setEditAddress(
                                              addressViewModel
                                                  .getAllAddressResponse
                                                  .data!
                                                  .allAddresses![index]);
                                          addressViewModel
                                              .setIsAddressAdd(false);
                                          Navigator.pushNamed(
                                              context, '/add_address');
                                        },
                                        icon: Icon(
                                          Icons.mode_edit_outlined,
                                          size: 20.h,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ):
        Container()
      );
    });
  }
}
