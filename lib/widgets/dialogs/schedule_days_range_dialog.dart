import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../main.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/custom_colors.dart';

Future scheduleDaysRangeDialog() {
  return showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Consumer<PlansViewModel>(builder: (_, planViewModel, __) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(20.0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: black18w500(data: 'Enter Number of Days'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: planViewModel.getScheduleSelectedDaysController,
                  onChanged: (text) {},
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Days',
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                customButton(
                    text: 'Submit',
                    onPressed: () {
                      planViewModel.setScheduleSelectedDishModel();
                      Navigator.pop(context);
                    },
                    colored: true),
              ],
            ),
          );
        });
      });
}
