import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../main.dart';

Future scheduleDateRangeCalenderDialog(){
  return showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return
          Consumer<PlansViewModel>(builder: (_, planViewModel, __) {
          return AlertDialog(
          contentPadding: const EdgeInsets.all(10.0),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          title: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
            ),
          ),
          content: SizedBox(
            height: 500.h,
            width: 500.w,
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              rowHeight: 45,
              selectedDayPredicate: (day) => isSameDay(planViewModel.getSelectedDay,day),
              rangeStartDay: planViewModel.getRangeStart,
              rangeEndDay: planViewModel.getRangeEnd,
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              onDaySelected: planViewModel.onDaySelected,
              onRangeSelected: planViewModel.onRangeSelected,
              focusedDay: planViewModel.getFocusedDay,
              firstDay: DateTime(2015),
              lastDay: DateTime(2030),
            ),
          ),
        );});
      });
}