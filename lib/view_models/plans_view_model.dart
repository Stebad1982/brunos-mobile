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
  //int _radioSelected = 1;
  DishesModel? _scheduleSelectedDish;
  int _scheduleEmptyTileNumber = 1;
  final TextEditingController _scheduleSelectedDaysController =
      TextEditingController();
  SelectedDishModel? _scheduleEmptyTile1;
  SelectedDishModel? _scheduleEmptyTile2;
  SelectedDishModel? _scheduleEmptyTile3;

/*  DateTime? _rangeStart;
  DateTime? _rangeEnd;*/
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 4));
  DateTime _selectedDay = DateTime.now().add(const Duration(days: 4));

  int get getScheduleEmptyTileNumber => _scheduleEmptyTileNumber;

  void setScheduleEmptyTileNumber(int value) {
    _scheduleEmptyTileNumber = value;
    notifyListeners();
  }

  void setScheduleSelectedDish(DishesModel value) {
    _scheduleSelectedDish = value;
  }

  TextEditingController get getScheduleSelectedDaysController =>
      _scheduleSelectedDaysController;

  SelectedDishModel? get getScheduleEmptyTile1 => _scheduleEmptyTile1;

  SelectedDishModel? get getScheduleEmptyTile2 => _scheduleEmptyTile2;

  SelectedDishModel? get getScheduleEmptyTile3 => _scheduleEmptyTile3;

  void setScheduleSelectedDishModel() {
    final SelectedDishModel applyDishDetail = SelectedDishModel(
        dishesModel: _scheduleSelectedDish!,
        totalDays: int.parse(_scheduleSelectedDaysController.text));
    if (_scheduleEmptyTileNumber == 1) {
      _scheduleEmptyTile1 = applyDishDetail;
      notifyListeners();
    } else if (_scheduleEmptyTileNumber == 2) {
      _scheduleEmptyTile2 = applyDishDetail;
      notifyListeners();
    } else {
      _scheduleEmptyTile3 = applyDishDetail;
      notifyListeners();
    }
  }

  DateTime get getFocusedDay => _focusedDay;

  DateTime? get getSelectedDay => _selectedDay;

/*  DateTime? get getRangeStart => _rangeStart;

  DateTime? get getRangeEnd => _rangeEnd;*/

//  List<DateTime> get getSelectedDates => _selectedDates;

  //int get getRadioVal => _radioSelected;

/*  void setRadioValue(int value) {
    _radioSelected = value;
    notifyListeners();
  }*/

  String get getPlanType => _planType;

  void setPlanType(String value) {
    _planType = value;
    notifyListeners();
  }

  void clearPlanData() {
  //  _radioSelected = 1;
    /*   _rangeStart = DateTime.now().add(const Duration(days: 4));
    _rangeEnd = DateTime.now().add(const Duration(days: 8));*/
    _scheduleEmptyTileNumber = 1;
    _scheduleEmptyTile1 = null;
    _scheduleEmptyTile2 = null;
    _scheduleEmptyTile3 = null;
    _focusedDay = DateTime.now().add(const Duration(days: 4));
    _selectedDay = DateTime.now().add(const Duration(days: 4));
    //  _selectedDates.clear();
    notifyListeners();
  }

/*  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay){
    DateFormat inputFormat = DateFormat('dd/MM/yyyy');
    _selectedDay = inputFormat.parse(start.toString());
    _rangeStart = inputFormat.parse(start.toString());
    _rangeEnd = inputFormat.parse(end.toString());
    notifyListeners();
  }*/

  void onDaySelected(DateTime day, DateTime focusDay) {
    /*if (_planType == Plans.monthly.text) {
      if (!isSameDay(_selectedDay, day)) {
        _selectedDay = day;
        focusDay = focusDay;
        notifyListeners();
      }
    } else {*/
      if (!isSameDay(_selectedDay, day)) {
        _selectedDay = day;
        focusDay = focusDay;
        notifyListeners();
      }
 /*   }*/

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
