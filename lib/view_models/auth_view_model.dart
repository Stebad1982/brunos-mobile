import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class AuthViewModel with ChangeNotifier {
  String _otpRouteFrom = Screens.registerUser.text;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _nameFieldError,
      _emailFieldError,
      _phoneFieldError,
      _passwordFieldError,
      _confirmPasswordFieldError;

  String? get getNameFieldError => _nameFieldError;

  void setNameFieldError(String value) {
    _nameFieldError = value;
    notifyListeners();
  }

  String? get getEmailFieldError => _emailFieldError;

  void setEmailFieldError(value) {
    _emailFieldError = value;
    notifyListeners();
  }

  String? get getPhoneFieldError => _phoneFieldError;

  void setPhoneFieldError(value) {
    _phoneFieldError = value;
    notifyListeners();
  }

  String? get getPasswordFieldError => _passwordFieldError;

  void setPasswordFieldError(value) {
    _passwordFieldError = value;
    notifyListeners();
  }

  String? get getConfirmPasswordFieldError => _confirmPasswordFieldError;

  void setConfirmPasswordFieldError(value) {
    _confirmPasswordFieldError = value;
    notifyListeners();
  }

  final SharedPref _sharedPref = SharedPref();

  String get getOtpRouteFrom => _otpRouteFrom;

  void setOtpRouteFrom(String value) {
    _otpRouteFrom = value;
    notifyListeners();
  }

  TextEditingController get getNameController => _name;

  TextEditingController get getEmailController => _emailController;

  TextEditingController get getPhoneController => _phoneController;

  TextEditingController get getPasswordController => _passwordController;

  TextEditingController get getConfirmPasswordController =>
      _confirmPasswordController;

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
