
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class AuthViewModel with ChangeNotifier {

  final SharedPref _sharedPref = SharedPref();


  Future<Widget> callVersionAndBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //setVersion(packageInfo.version);
   // setBuild(packageInfo.buildNumber);
    if (Platform.isAndroid) {
     // setOperatingSystem('Android');
    } else {
     // setOperatingSystem('iOS');
    }
    final authToken =
    await _sharedPref.read(SharedPreferencesKeys.authToken.text);
    await Future.delayed(const Duration(seconds: 4), () {});
    if (authToken == null) {
      return const IntroSlidesScreen();
    } else {
      Widget routeTo = LoginScreen();
    /*  await callSplashApi().then((value) {
        if (value) {
          routeTo = DashboardScreen();
        } else {
          routeTo = LoginScreen();
        }
      });*/
      return routeTo;
    }
  }
}
