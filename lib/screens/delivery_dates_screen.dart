import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/custom_buttons.dart';
import '../utils/images.dart';
import '../widgets/app_bar_with_back_widget.dart';

class DeliveryDatesScreen extends StatefulWidget {
  const DeliveryDatesScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryDatesScreen> createState() => _DeliveryDatesScreenState();
}

class _DeliveryDatesScreenState extends State<DeliveryDatesScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackWidget(
        heading: 'Transitional Plan',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Image.asset(
                  buyBulits2,
                  height: 57.h,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              black24w500Centre(data: 'Select Your Delivery Date'),
              SizedBox(
                height: 10.h,
              ),
              black14w400Centre(
                  data:
                      'Order by 4pm to receive your doggies dishes between 9am- 12noon the following day'),
              SizedBox(
                height: 30.h,
              ),
              TableCalendar(
                rowHeight: 45,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                locale: 'en_US',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: today,
                onDaySelected: _onDaySelected,
                calendarStyle: CalendarStyle(selectedDecoration: const BoxDecoration(color: CustomColors.orangeColor,shape: BoxShape.circle),
                todayDecoration: BoxDecoration(color: CustomColors.orangeColorTint,shape: BoxShape.circle)),
              ),
              SizedBox(height: 20.h,),
              brown14w400Centre(data: 'Great! Now tell us where we will be delivering our tail-wagging meals',centre: true),
              SizedBox(height: 20.h,),
              customButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, checkOutRoute);
                  },
                  colored: true),
            ],
          ),
        ),
      ),
    );
  }


}
