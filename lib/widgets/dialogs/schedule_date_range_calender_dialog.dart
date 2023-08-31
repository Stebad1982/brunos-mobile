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

Future scheduleDateRangeCalenderDialog() {
  return showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Consumer<PlansViewModel>(builder: (_, planViewModel, __) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(20.0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: black18w500(data: 'Select Dates'),
            content: SizedBox(
              height: 350.h,
              width: 500.w,
              child: Column(
                children: [
                  TableCalendar(
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    rowHeight: 45,
                    selectedDayPredicate: (day) =>
                        isSameDay(planViewModel.getSelectedDay, day),
                    rangeStartDay: planViewModel.getRangeStart,
                    rangeEndDay: planViewModel.getRangeEnd,
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
                    onDaySelected: planViewModel.onDaySelected,
                    onRangeSelected: planViewModel.onRangeSelected,
                    focusedDay: planViewModel.getFocusedDay,
                    firstDay: planViewModel.getFocusedDay,
                    lastDay: DateTime(2040),
                    calendarStyle: CalendarStyle(
                        rangeHighlightColor: CustomColors.orangeColorTint,
                        rangeStartDecoration: const BoxDecoration(
                            color: CustomColors.orangeColor,
                            shape: BoxShape.circle),
                        rangeEndDecoration: const BoxDecoration(
                            color: CustomColors.orangeColor,
                            shape: BoxShape.circle),
                          selectedDecoration: const BoxDecoration(
                          color: CustomColors.orangeColor,
                          shape: BoxShape.circle),
                        todayDecoration: const BoxDecoration(
                            color: CustomColors.yellowColor,
                            shape: BoxShape.circle)),
                  ),
                  Spacer(),
                  customButton(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      colored: true),
                ],
              ),
            ),
          );
        });
      });
}
