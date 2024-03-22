import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../widgets/app_bar_with_back_widget.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
          heading: 'Delete Account', showPuppy: false, showCart: false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            black16w500(
                data:
                    'This will delete your account permanently. You will not be able to retrieve your data unless you log in again in the next 10 days.'),
            SizedBox(
              height: 20.h,
            ),
            customButton(text: 'Delete Now', onPressed: () {}, colored: true),
            SizedBox(
              height: 20.h,
            ),
            black16w500(data: 'OR'),
            SizedBox(
              height: 20.h,
            ),
            customButton(text: 'Contact Support', onPressed: () {

            }, colored: false),

          ],
        ),
      ),
    );
  }
}
