import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../utils/enums.dart';
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
                      //await faqsBlogsNewsViewModel.callAddFeedbackApi();
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
                  height: 10.h,
                ),
                Center(child: black12w500Centre(data: 'OR')),
                SizedBox(
                  height: 10.h,
                ),
                customButton(
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
