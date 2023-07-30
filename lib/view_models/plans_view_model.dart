
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

  String get getPlanType => _planType;

  void setPlanType (String value){
    _planType = value;
    notifyListeners();
  }

}
