// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:brunos_kitchen/screens/home_screen.dart';
import 'package:brunos_kitchen/screens/logIn_screen.dart';
import 'package:brunos_kitchen/screens/profile_screen.dart';
import 'package:brunos_kitchen/screens/shop_screen.dart';

import 'package:flutter/cupertino.dart';

class BottomNavigationViewModel extends ChangeNotifier {
  int homeViewIndex = 0;

  Widget getHomeView(int index) {
    Widget _widget = Container();
    if (index == 0) {
      _widget = const HomeScreen();
    } else if (index == 1) {
      _widget = const ShopScreen();
    } else if (index == 2) {
      _widget = const ProfileScreen();
    }
    return _widget;
  }

  void update() {
    notifyListeners();
  }
}
