import 'dart:io';

import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/register_puppy_request.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/services/puppy_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class PuppyViewModel with ChangeNotifier {
  String _routeToPuppyFrom = Screens.home.text;
  final PuppyApiServices _puppyApiServices = PuppyApiServices();
  final TextEditingController _puppyNameController = TextEditingController();
  String _puppyImage = '';
  String _puppyGender = Puppy.boy.text;
  bool _puppyIsSpayNeuter = true;
  String _puppyBreed = 'Germen Shepherd';
  int _puppyDob = 0;
  int _puppyCurrentWeight = 0;
  int _puppyActualWeight = 0;
  String _puppyActivityLevel = Puppy.active.text;

  TextEditingController get getPuppyNameController => _puppyNameController;

  String get getPuppyGender => _puppyGender;

  void setPuppyGender (String value){
    _puppyGender = value;
    notifyListeners();
  }

  String get getRouteToPuppyFrom => _routeToPuppyFrom;

  void setRouteToPuppyFrom(String value) {
    _routeToPuppyFrom = value;
    notifyListeners();
  }

  Future<bool> callRegisterPuppyApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final RegisterPuppyRequest registerPuppyRequest = RegisterPuppyRequest(
          name: _puppyNameController.text,
          media: _puppyImage,
          gender: _puppyGender,
          isSpayNeuter: _puppyIsSpayNeuter,
          breed: _puppyBreed,
          bornOnDate: _puppyDob,
          currentWeight: _puppyCurrentWeight,
          actualWeight: _puppyActualWeight,
          activityLevel: _puppyActivityLevel);

      final BaseResponseModel response = await _puppyApiServices.addPuppyApi(
         registerPuppyRequest: registerPuppyRequest);
      if (response.isSuccess!) {
        //  setImageSlider();
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }
}
