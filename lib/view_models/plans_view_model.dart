import 'dart:io';

import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:table_calendar/table_calendar.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class PlansViewModel with ChangeNotifier {
  String _planType = Plans.transitional.text;
  int _radioSelected = 1;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  List<DateTime> _selectedDates = [];
  DateTime get getFocusedDay => _focusedDay;

  DateTime? get getSelectedDay => _selectedDay;

  DateTime? get getRangeStart => _rangeStart;

  DateTime? get getRangeEnd => _rangeEnd;

  List<DateTime> get getSelectedDates => _selectedDates;

  int get getRadioVal => _radioSelected;

  void setRadioValue(int value) {
    _radioSelected = value;
    notifyListeners();
  }

  String get getPlanType => _planType;

  void setPlanType(String value) {
    _planType = value;
    notifyListeners();
  }

  void clearCalenderValues() {
    _radioSelected = 1;
    _selectedDates.clear();
    notifyListeners();
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay){
    _selectedDay = null;
    _rangeStart = start;
    _rangeEnd = end;
    notifyListeners();
  }

  void onDaySelected(DateTime day, DateTime focusDay) {

    if(_planType == Plans.monthly.text){
      if(!isSameDay(_selectedDay, day)){
        _selectedDay = day;
        focusDay = focusDay;
        notifyListeners();
      }
    }

  /*  if(_planType == Plans.transitional.text){
      final List<DateTime> allBatches = [
        day,
        day.add(const Duration(days: 10)),
        day.add(const Duration(days: 20))
      ];
      _selectedDates = allBatches;
    }
    else{
      if (_selectedDates.contains(day)) {
        _selectedDates.remove(day);
      } else {
        _selectedDates.add(day);
      }
    }*/

    notifyListeners();
  }
}
