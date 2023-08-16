import 'dart:async';

import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locator;
import 'package:provider/provider.dart';

import '../../utils/custom_buttons.dart';
import '../../utils/custom_colors.dart';
import '../../utils/enums.dart';
import '../../utils/images.dart';
import '../../view_models/auth_view_model.dart';
import '../../widgets/app_bar_with_back_widget.dart';
import '../../view_models/address_view_model.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddressViewModel>(
        builder: (context, addressViewModel, child) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
          heading:
              addressViewModel.getIsAddressAdd ? 'Add Address' : 'Edit Address',
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 480.h,
                child: Stack(
                  children: [
                    GoogleMap(
                      padding: const EdgeInsets.only(top: 130.0, right: 10),
                      zoomControlsEnabled: false,
                      //liteModeEnabled: true,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.terrain,
                      onCameraMove: (position) {
                        addressViewModel.setInitialCameraPosition(LatLng(
                            position.target.latitude,
                            position.target.longitude));
                      },
                      onCameraIdle: () {
                        addressViewModel.convertCoordinatesToPlaces();
                      },
                      initialCameraPosition: CameraPosition(
                          target: addressViewModel.getInitialCameraPosition),
                      markers: <Marker>{
                        Marker(
                          onDragEnd: ((newPosition) {
                            addressViewModel.updateMapCameraPosition(LatLng(
                                newPosition.latitude, newPosition.longitude));
                          }),
                          draggable: true,
                          markerId: const MarkerId("1"),
                          position: addressViewModel.getInitialCameraPosition,
                          icon: BitmapDescriptor.defaultMarker,
                          infoWindow: const InfoWindow(
                            title: '',
                          ),
                        )
                      },
                      onMapCreated: addressViewModel.getUserLocation,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: !addressViewModel.getIsAddressAdd,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GestureDetector(
                                onTap: () {
                                  /* addressViewModel
                                .callDeleteAddressApi()
                                .then((value) {
                              if (value) {
                                Navigator.pop(context);
                                context
                                    .read<AuthViewModel>()
                                    .setSelectedAddress(addressViewModel
                                        .getAllAddressResponse
                                        .data!
                                        .defaultAddress!);
                              }
                        });*/
                                },
                                child: black14w500(data: 'Delete Address'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller:
                                addressViewModel.getNearByLocationController,
                            decoration: const InputDecoration(
                              fillColor: CustomColors.whiteColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              // border: const OutlineInputBorder(),
                              hintText: 'Search Location',
                            ),
                            onChanged: (value) {
                              if (addressViewModel.getDebounce != null) {
                                addressViewModel.getDebounce!.cancel();
                              }
                              addressViewModel.setDebounce(
                                  Timer(const Duration(milliseconds: 1000), () {
                                if (value.isNotEmpty) {
                                  addressViewModel.autoCompleteSearch(value);
                                }
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Visibility(
                          visible: addressViewModel.getPrediction.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Card(
                              elevation: 5,
                              color: CustomColors.orangeColor,
                              borderOnForeground: false,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r)),
                                side: BorderSide(
                                  color: addressViewModel.getSelectedLabel == 2
                                      ? CustomColors.purpleColor
                                      : CustomColors.yellowColor,
                                  width: 1.0,
                                ),
                              ),
                              child: ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.h, vertical: 5.h),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      addressViewModel.getPrediction.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                        elevation: 5,
                                        color: CustomColors.orangeColor,
                                        borderOnForeground: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0.r)),
                                          side: BorderSide(
                                            color: addressViewModel
                                                        .getSelectedLabel ==
                                                    2
                                                ? CustomColors.purpleColor
                                                : CustomColors.yellowColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            addressViewModel
                                                .setSelectedPrediction(
                                                    addressViewModel
                                                        .getPrediction[index]);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(addressViewModel
                                                .getPrediction[index]
                                                .description!),
                                          ),
                                        ));
                                  }),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller:
                                addressViewModel.getFullAddressController,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              fillColor: CustomColors.whiteColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              // border: const OutlineInputBorder(),
                              hintText: 'Enter Flat/House Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5,
                        spreadRadius: 2,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        black18w500(data: 'Add Label'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //   addressViewModel.callLocation(context);
                                addressViewModel.setSelectedLabel(AddressLabels.home.text);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          addressViewModel.getSelectedLabel == AddressLabels.home.text
                                              ? CustomColors.orangeColor
                                              : CustomColors.whiteColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: CustomColors.orangeColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        homeAddressIcon,
                                        width: 24.w,
                                        color:
                                            addressViewModel.getSelectedLabel ==
                                                AddressLabels.home.text
                                                ? CustomColors.whiteColor
                                                : CustomColors.orangeColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                                  addressViewModel.getSelectedLabel == AddressLabels.home.text
                                      ? orange14w400(data: 'Home')
                                      : black14w400Centre(data: 'Home'),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.w,),
                            GestureDetector(
                              onTap: () {
                                //   addressViewModel.callLocation(context);
                                addressViewModel.setSelectedLabel(AddressLabels.work.text);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      addressViewModel.getSelectedLabel == AddressLabels.work.text
                                          ? CustomColors.orangeColor
                                          : CustomColors.whiteColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: CustomColors.orangeColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        workAddressIcon,
                                        width: 24.w,
                                        color:
                                        addressViewModel.getSelectedLabel ==
                                            AddressLabels.work.text
                                            ? CustomColors.whiteColor
                                            : CustomColors.orangeColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                                  addressViewModel.getSelectedLabel == AddressLabels.work.text
                                      ? orange14w400(data: 'Work')
                                      : black14w400Centre(data: 'Work'),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.w,),
                            GestureDetector(
                              onTap: () {
                                //   addressViewModel.callLocation(context);
                                addressViewModel.setSelectedLabel(AddressLabels.partner.text);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      addressViewModel.getSelectedLabel == AddressLabels.partner.text
                                          ? CustomColors.orangeColor
                                          : CustomColors.whiteColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: CustomColors.orangeColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        partnerAddressIcon,
                                        width: 24.w,
                                        color:
                                        addressViewModel.getSelectedLabel ==
                                            AddressLabels.partner.text
                                            ? CustomColors.whiteColor
                                            : CustomColors.orangeColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                                  addressViewModel.getSelectedLabel == AddressLabels.partner.text
                                      ? orange14w400(data: 'Partner')
                                      : black14w400Centre(data: 'Partner'),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.w,),
                            GestureDetector(
                              onTap: () {
                                //   addressViewModel.callLocation(context);
                                addressViewModel.setSelectedLabel(AddressLabels.other.text);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                      addressViewModel.getSelectedLabel == AddressLabels.other.text
                                          ? CustomColors.orangeColor
                                          : CustomColors.whiteColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: CustomColors.orangeColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        otherAddressIcon,
                                        width: 24.w,
                                        color:
                                        addressViewModel.getSelectedLabel ==
                                            AddressLabels.other.text
                                            ? CustomColors.whiteColor
                                            : CustomColors.orangeColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                                  addressViewModel.getSelectedLabel == AddressLabels.other.text
                                      ? orange14w400(data: 'Other')
                                      : black14w400Centre(data: 'Other'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            black18w500(data: 'Set As Default'),
                            Transform.scale(
                              scale: 0.8,
                              child: CupertinoSwitch(
                                activeColor: CustomColors.orangeColor,
                                value: addressViewModel.getIsDefault,
                                onChanged: (value) {
                                  addressViewModel.setIsDefault(value);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        customButton(
                            text: addressViewModel.getIsAddressAdd
                                ? 'Submit'
                                : 'Update',
                            onPressed: () async {
                                if (addressViewModel.validateAddress()) {
                                  if (addressViewModel.getIsAddressAdd) {
                                    await addressViewModel
                                        .callCreateAddressApi()
                                        .then((value) {
                                      Navigator.pop(context);
/*
                                      if (value) {
                                        context
                                            .read<AuthViewModel>()
                                            .setSelectedAddress(addressViewModel
                                                .getAllAddressResponse
                                                .data!
                                                .defaultAddress!);
                                      }
*/
                                    });
                                  } /*else {
                                    await addressViewModel
                                        .callUpdateAddressApi()
                                        .then((value) {
                                      if (value) {
                                        Navigator.pop(context);
                                        context
                                            .read<AuthViewModel>()
                                            .setSelectedAddress(addressViewModel
                                                .getAllAddressResponse
                                                .data!
                                                .defaultAddress!);
                                      }
                                    });
                                  }*/
                                } else {
                                  EasyLoading.showToast('Please Fill All Fields');
                                }
                            },
                            colored: true),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
