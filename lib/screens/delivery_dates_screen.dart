import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/enums.dart';
import 'package:brunos_kitchen/view_models/plans_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
          heading: plansViewModel.getPlanType == Plans.transitional.text
              ? 'Transitional Plan'
              : plansViewModel.getPlanType == Plans.monthly.text
                  ? 'Monthly Plan'
                  : 'One time Order',
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
                black24w500Centre(
                    data: plansViewModel.getPlanType == Plans.monthly.text
                        ? 'Schedule your meal deliveries'
                        : 'Select Your Delivery Date'),
                SizedBox(
                  height: 10.h,
                ),
                black14w400Centre(
                    data:
                        'Order by 4pm to receive your doggies dishes between 9am- 12noon the following day'),
                SizedBox(
                  height: 30.h,
                ),
                Visibility(
                  visible: plansViewModel.getPlanType == Plans.monthly.text,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Radio(
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              value: "radio value",
                              groupValue: "group value",
                              onChanged: (value) {
                                print(value); //selected value
                              }),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        black14w400Centre(data: 'One time Delivery'),
                        Spacer(),
                        Transform.scale(
                          scale: 1,
                          child: Radio(
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              value: "radio value",
                              groupValue: "group value",
                              onChanged: (value) {
                                print(value); //selected value
                              }),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        black14w400Centre(
                            data: 'Scheduled Delivery\n( Every 10 days )',
                            left: true)
                      ],
                    ),
                  ),
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
                  calendarStyle: CalendarStyle(
                      selectedDecoration: const BoxDecoration(
                          color: CustomColors.orangeColor,
                          shape: BoxShape.circle),
                      todayDecoration: BoxDecoration(
                          color: CustomColors.orangeColorTint,
                          shape: BoxShape.circle)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Visibility(
                  visible: plansViewModel.getPlanType == Plans.monthly.text,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: black16w500(
                              data: 'Your order will be delivered')),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: black14w400Centre(data: 'Order Summary')),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          color: CustomColors.greyMediumLightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              black16w500(data: 'Meal Batch'),
                              black16w500(data: 'Deliver on'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          color: CustomColors.whiteColor,
                          border: Border.all(color: CustomColors.lightGreyColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              black14w400Centre(data: 'Batch 1 (Beefy Barkfest)'),
                              black14w400Centre(data: '3 June 2023'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          color: CustomColors.whiteColor,
                          border: Border.all(color: CustomColors.lightGreyColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              black14w400Centre(data: 'Batch 1 (Beefy Barkfest)'),
                              black14w400Centre(data: '3 June 2023'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          color: CustomColors.whiteColor,
                          border: Border.all(color: CustomColors.lightGreyColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              black14w400Centre(data: 'Batch 1 (Beefy Barkfest)'),
                              black14w400Centre(data: '3 June 2023'),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                brown14w400Centre(
                    data:
                        'Great! Now tell us where we will be delivering our tail-wagging meals',
                    centre: true),
                SizedBox(
                  height: 20.h,
                ),
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
    });
  }
}
