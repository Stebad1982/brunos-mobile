import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../route_generator.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  black18w500(data: 'Default Address'),
                  SizedBox(height: 20.h,),
                  Container(
                    decoration: ShapeDecoration(
                      color: CustomColors.lightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.whiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1, color: CustomColors.orangeColor),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                homeAddressIcon,
                                width: 24.w,
                                color: CustomColors.orangeColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              black18w500(data: 'Mina Jebel Ali'),
                              black14w400Centre(data: 'Dubai - UAE'),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              navigatorKey.currentContext!
                                  .read<AddressViewModel>()
                                  .setIsAddressAdd(false);
                              Navigator.pushNamed(
                                  navigatorKey.currentContext!, addAddressRoute2);
                            },
                            child: Container(
                              decoration: ShapeDecoration(
                                color: CustomColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.75,
                                      color: CustomColors.greyMediumColor),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: CustomColors.orangeColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: black18w500(data: 'Other Address'),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    itemBuilder: (BuildContext context, int index) {
                      return addressVerticalListChipWidget();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
