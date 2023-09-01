import 'dart:io';

import 'package:brunos_kitchen/models/dishes_model.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:table_calendar/table_calendar.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class PlansViewModel with ChangeNotifier {
  String _planType = Plans.transitional.text;
  int _radioSelected = 1;
  int _selectedDish = 1;
  SelectedDishModel? _selectedDishModel1;
  SelectedDishModel? _selectedDishModel2;
  SelectedDishModel? _selectedDishModel3;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 4));
  DateTime _selectedDay = DateTime.now().add(const Duration(days: 4));

  int get getSelectedDish => _selectedDish;

  void setSelectedDish (int value){
    _selectedDish = value;
    notifyListeners();
  }

  SelectedDishModel? get getSelectedDishModel1 => _selectedDishModel1;
  SelectedDishModel? get getSelectedDishModel2 => _selectedDishModel2;
  SelectedDishModel? get getSelectedDishModel3 => _selectedDishModel3;


  void setSelectedDishModel(SelectedDishModel value){
    if(_selectedDish == 1){
      _selectedDishModel1 = value;
      notifyListeners();
    }
    else if(_selectedDish == 2){
      _selectedDishModel2 = value;
      notifyListeners();
    }
    else{
      _selectedDishModel3 = value;
      notifyListeners();
    }
  }
  DateTime get getFocusedDay => _focusedDay;

  DateTime? get getSelectedDay => _selectedDay;

  DateTime? get getRangeStart => _rangeStart;

  DateTime? get getRangeEnd => _rangeEnd;

//  List<DateTime> get getSelectedDates => _selectedDates;

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
    _rangeStart = DateTime.now().add(const Duration(days: 4));
    _rangeEnd = DateTime.now().add(const Duration(days: 8));
    _focusedDay = DateTime.now().add(const Duration(days: 4));
    _selectedDay = DateTime.now().add(const Duration(days: 4));
  //  _selectedDates.clear();
    notifyListeners();
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay){
    DateFormat inputFormat = DateFormat('dd/MM/yyyy');
    _selectedDay = inputFormat.parse(start.toString());
    _rangeStart = inputFormat.parse(start.toString());
    _rangeEnd = inputFormat.parse(end.toString());
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

    else{
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
