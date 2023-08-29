import 'dart:io';

import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class PlansViewModel with ChangeNotifier {
  String _planType = Plans.transitional.text;
  int _radioSelected = 1;
  List<DateTime> _selectedDates = [];

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

  void onDaySelected(DateTime day, DateTime focusDay) {

    if(_radioSelected == 2){
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
    }

    notifyListeners();
  }
}
