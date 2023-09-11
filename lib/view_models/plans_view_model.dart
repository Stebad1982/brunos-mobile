import 'dart:io';

import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/models/responses/recipes_list_response.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/services/plan_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:table_calendar/table_calendar.dart';

import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class PlansViewModel with ChangeNotifier {
  final PlanApiServices _planApiServices = PlanApiServices();
  String _planType = Plans.transitional.text;
  RecipesListResponse _recipesListResponse = RecipesListResponse();
  RecipeModel _selectedRecipe = RecipeModel();
  int _monthlyEmptyTileNumber = 1;
  final TextEditingController _monthlySelectedDaysController =
      TextEditingController();
  RecipeModel? _monthlyEmptyTile1;
  RecipeModel? _monthlyEmptyTile2;
  RecipeModel? _monthlyEmptyTile3;
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 4));
  DateTime _selectedDay = DateTime.now().add(const Duration(days: 4));

  RecipesListResponse get getRecipesListResponse => _recipesListResponse;

  void setRecipesListResponse (RecipesListResponse value){
    _recipesListResponse = value;
    notifyListeners();
  }

  int get getMonthlyEmptyTileNumber => _monthlyEmptyTileNumber;

  void setMonthlyEmptyTileNumber(int value) {
    _monthlyEmptyTileNumber = value;
    notifyListeners();
  }

  RecipeModel get getSelectedRecipe => _selectedRecipe;

  void setSelectedRecipe(RecipeModel value) {
    _selectedRecipe = value;
  }

  TextEditingController get getMonthlySelectedDaysController =>
      _monthlySelectedDaysController;

  RecipeModel? get getMonthlyEmptyTile1 => _monthlyEmptyTile1;

  RecipeModel? get getMonthlyEmptyTile2 => _monthlyEmptyTile2;

  RecipeModel? get getMonthlyEmptyTile3 => _monthlyEmptyTile3;

  void setMonthlySelectedDishModel() {
    _selectedRecipe.totalDays = int.parse(_monthlySelectedDaysController.text);
    final RecipeModel applyDishDetail = _selectedRecipe;
    if (_monthlyEmptyTileNumber == 1) {
      _monthlyEmptyTile1 = applyDishDetail;
      notifyListeners();
    } else if (_monthlyEmptyTileNumber == 2) {
      _monthlyEmptyTile2 = applyDishDetail;
      notifyListeners();
    } else {
      _monthlyEmptyTile3 = applyDishDetail;
      notifyListeners();
    }
  }

  DateTime get getFocusedDay => _focusedDay;

  DateTime? get getSelectedDay => _selectedDay;

  String get getPlanType => _planType;

  void setPlanType(String value) {
    _planType = value;
    notifyListeners();
  }

  void clearPlanData() {
    _monthlyEmptyTileNumber = 1;
    _monthlyEmptyTile1 = null;
    _monthlyEmptyTile2 = null;
    _monthlyEmptyTile3 = null;
    _focusedDay = DateTime.now().add(const Duration(days: 4));
    _selectedDay = DateTime.now().add(const Duration(days: 4));
    notifyListeners();
  }
  void onDaySelected(DateTime day, DateTime focusDay) {
      if (!isSameDay(_selectedDay, day)) {
        _selectedDay = day;
        focusDay = focusDay;
        notifyListeners();
      }
  }

  Future<bool> callAllRecipesApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final RecipesListResponse response =
      await _planApiServices.allRecipes();
      if (response.isSuccess!) {
        setRecipesListResponse(response);
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
