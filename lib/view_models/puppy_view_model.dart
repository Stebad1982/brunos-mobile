
import 'dart:io';

import 'package:brunos_kitchen/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class PuppyViewModel with ChangeNotifier {
  String _routeToPuppyFrom = Screens.home.text;

  String get getRouteToPuppyFrom => _routeToPuppyFrom;

  void setRouteToPuppyFrom (String value){
    _routeToPuppyFrom = value;
    notifyListeners();
  }

}
