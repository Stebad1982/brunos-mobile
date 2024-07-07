import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
import '../view_models/address_view_model.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/faqs_blogs_news_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/dialogs/discription_dialog.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    /*  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FaqsBlogsNewsViewModel>().clearWebView();
      context
          .read<FaqsBlogsNewsViewModel>()
          .setWebView(url: "https://brunos.kitchen/contacts/");
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    return Consumer<FaqsBlogsNewsViewModel>(
        builder: (_, faqsBlogsNewsViewModel, __) {
      return Scaffold(
        appBar: const AppBarWithBackWidget(
            heading: 'Get Help', showPuppy: false, showCart: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  WebViewWidget(
                      controller: faqsBlogsNewsViewModel.getWebViewController,
                    ),*/
                black24w500Centre(data: 'Contact us'),
                SizedBox(
                  height: 20.h,
                ),
                lightBlack14w400Centre(
                    left: true,
                    data:
                        'We\’d love to hear from you – please use the form to send us your message or ideas. Or simply pop in for a cup of fresh tea and a cookie:'),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: faqsBlogsNewsViewModel.getComment,
                  onChanged: (text) {},
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Your Comment',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                customButton(
                  colored: true,
                  text: 'Submit',
                  onPressed: () async {
                    if (faqsBlogsNewsViewModel.validateComment()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      await faqsBlogsNewsViewModel.callAddCommentApi();
                      faqsBlogsNewsViewModel.clearComment();
                    } else {
                      descriptionDialog(
                          context: context,
                          description: 'Kindly fill Comment',
                          height: 160.h,
                          title: 'Alert');
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 130.h,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)),
                  /*  child: GoogleMap(
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
                        addressViewModel.getMapMovement();
                      },
                      initialCameraPosition: CameraPosition(
                          target: addressViewModel.getInitialCameraPosition),
                      markers: <Marker>{
                        Marker(
                          *//* onDragEnd: ((newPosition) {
                            addressViewModel.updateMapCameraPosition(LatLng(
                                newPosition.latitude, newPosition.longitude));
                          }),*//*
                          //draggable: false,
                          markerId: const MarkerId("1"),
                          position: LatLng(
                              double.parse(addressViewModel
                                  .getEditAddress.coordinates![0]),
                              double.parse(addressViewModel
                                  .getEditAddress.coordinates![1])),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueOrange),
                          infoWindow: const InfoWindow(
                            title: '',
                          ),
                        )
                      },
                      onMapCreated: addressViewModel.getUserLocation,
                    ),*/
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                black16w500(data: 'Shop no.17, Paragon Bay Mall, Marina Square\nAl Reem Island, Abu Dhabi, UAE', align: TextAlign.center),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: Contact.phone.text,
                    );
                    await launchUrl(launchUri);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.volume_up_outlined,
                        color: CustomColors.blackColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      black16w500(data: Contact.phone.text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: Contact.email.text,
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Get Help',
                      }),
                    );
                    await launchUrl(emailLaunchUri);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        color: CustomColors.blackColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      black16w500(data: Contact.email.text),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () async {
                    final Uri webUrl = Uri.parse(Contact.webUrl.text);

                    if (!await launchUrl(webUrl)) {
                      throw Exception('Could not launch $webUrl');
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: CustomColors.blackColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      black16w500(data: 'www.brunos.kitchen'),
                    ],
                  ),
                ),
                /*customButton(
                  colored: false,
                  text: 'Call Now',
                  icon: Icons.phone,
                  onPressed: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: Contact.phone.text,
                    );
                    await launchUrl(launchUri);
                  },
                ),*/
              ],
            ),
          ),
        ),
      );
    });
  }
}
