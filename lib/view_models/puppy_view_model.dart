import 'dart:io';

import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/register_puppy_request.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/services/puppy_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../dunmmy_data.dart';
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
  final TextEditingController _puppyBreedController = TextEditingController();
  int _puppyDob = 0;
  int _puppyCurrentWeight = 0;
  int _puppyActualWeight = 0;
  String _puppyActivityLevel = Puppy.active.text;
  String _puppyNameFieldError = '';
  String _puppyImageFieldError = '';

  TextEditingController get getPuppyBreedController => _puppyBreedController;

  String get getPuppyNameFieldError =>_puppyNameFieldError;

  void setPuppyNameFieldError (String value){
    _puppyNameFieldError = value;
    notifyListeners();
  }

  String get getPuppyImageFieldError =>_puppyImageFieldError;

  void setPuppyImageFieldError (String value){
    _puppyImageFieldError = value;
    notifyListeners();
  }

  TextEditingController get getPuppyNameController => _puppyNameController;

  bool get getPuppyIsSpayNeuter => _puppyIsSpayNeuter;

  void setPuppyIsSpayNeuter (bool value){
    _puppyIsSpayNeuter = value;
    notifyListeners();
  }

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

  bool puppyNameValidation() {
    if (_puppyNameController.text.isEmpty) {
      setPuppyNameFieldError('Please Enter Pet Name');
      return false;
    } else {
      setPuppyNameFieldError('');
      return true;
    }
  }

  bool puppyImageValidation() {
    if (_puppyImage.isEmpty) {
      setPuppyImageFieldError('Please Enter Pet Image');
      return false;
    } else {
      setPuppyImageFieldError('');
      return true;
    }
  }

  bool puppyCreationValidation(){
    if(puppyNameValidation()&&puppyImageValidation()){
      return true;
    }
    else{
      return false;
    }
  }

  bool puppyContinueCreationValidation(){
    return true;
  }

  void searchBreeds(String query) {
    final suggestions = breedsList.where((breed){
      return breed.contains(query);
    }).toList();
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
          breed: _puppyBreedController.text,
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
