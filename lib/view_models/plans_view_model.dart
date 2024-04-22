import 'dart:convert';

import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/cart_model.dart';
import 'package:brunos_kitchen/models/puppy_model.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/models/responses/recipes_list_response.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/services/plan_api_services.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/item_sizes_model.dart';
import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/calculations.dart';
import '../utils/shared_pref .dart';

class PlansViewModel with ChangeNotifier {
  final PlanApiServices _planApiServices = PlanApiServices();
  String _productCategory = '';
  String _selectedFeaturedRecipe = FeaturedRecipeType.adult.text;
  int _quantity = 1;
  int _availableDays = 0;
  int _daysCount = 1;

  //ItemSizes? _selectedItemSize;
  CartModel? _feedingPlan;
  num _transitionalGrams1to3Days = 0;
  num _transitionalGrams4to6Days = 0;
  num _transitionalGrams7to9Days = 0;
  num _transitionalGrams10thDay = 0;

  //final List<String> _pouchesDetail = [];

  //bool _showDaysRangeValidation = false;
  String _planType = Plans.transitional.text;
  RecipesListResponse _recipesListResponse = RecipesListResponse();
  RecipeModel _selectedRecipe = RecipeModel();
  List<RecipeModel> _recipesList = [];
  List<RecipeModel> _productsList = [];
  List<RecipeModel> _featuredRecipesList = [];
  List<RecipeModel> _selectedFeaturedRecipesList = [];
  List<RecipeModel> _featuredProductsList = [];
  List<RecipeModel> _comboRecipesList = [];
  List<RecipeModel> _recommendedRecipesList = [];
  List<RecipeModel> _oneTimeRecipesList = [];

  int _monthlyEmptyTileNumber = 1;
  final TextEditingController _monthlySelectedDaysController =
      TextEditingController();
  RecipeModel? _monthlyEmptyTile1;
  RecipeModel? _monthlyEmptyTile2;
  RecipeModel? _monthlyEmptyTile3;

  //ItemSizes? get getSelectedItemSize => _selectedItemSize;

  void setSelectedItemSize(ItemSizes value) {
    _selectedRecipe.selectedItemSize = value;
    _selectedRecipe.pricePerKG = value.price;
    notifyListeners();
  }

  //List<String> get getPouchesDetail => _pouchesDetail;

  String get getSelectedFeaturedRecipe => _selectedFeaturedRecipe;

  List<RecipeModel> get getSelectedFeaturedRecipesList =>
      _selectedFeaturedRecipesList;

  void setSelectedFeaturedRecipe(String value) {
    _selectedFeaturedRecipe = value;
    _selectedFeaturedRecipesList = _featuredRecipesList
        .where((element) => element.lifeStage == value)
        .toList();
    notifyListeners();
  }

  String get getProductCategory => _productCategory;

  num get getTransitionalGrams1to3Days => _transitionalGrams1to3Days;

  num get getTransitionalGrams4to6Days => _transitionalGrams4to6Days;

  num get getTransitionalGrams7to9Days => _transitionalGrams7to9Days;

  num get getTransitionalGrams10thDay => _transitionalGrams10thDay;

  int get getDaysCount => _daysCount;

  List<RecipeModel> get getComboRecipesList => _comboRecipesList;

  List<RecipeModel> get getRecommendedRecipesList => _recommendedRecipesList;

  List<RecipeModel> get getOneTimeRecipesList => _oneTimeRecipesList;

  List<RecipeModel> get getFeaturedRecipesList => _featuredRecipesList;

  List<RecipeModel> get getFeaturedProductList => _featuredProductsList;

  List<RecipeModel> get getRecipesList => _recipesList;

  List<RecipeModel> get getProductList => _productsList;

  RecipesListResponse get getRecipesListResponse => _recipesListResponse;

  int get getAvailableDays => _availableDays;

  int get getQuantity => _quantity;

  void addDaysCount() {
    _daysCount = ++_daysCount;
    notifyListeners();
  }

  void minusDaysCount() {
    if (_daysCount != 1) {
      _daysCount = --_daysCount;
      notifyListeners();
    }
  }

  void addQuantity() {
    _quantity = ++_quantity;
    notifyListeners();
  }

  void minusQuantity() {
    if (_quantity != 1) {
      _quantity = --_quantity;
      notifyListeners();
    }
  }

//  bool get getDayRangeValidation => _showDaysRangeValidation;

  /*void setDayRangeValidation (bool value){
    _showDaysRangeValidation = value;
    notifyListeners();
  }*/

  /* bool checkAndUpdateAvailableDays (){
    final newAvailableDays = _availableDays + int.parse(_monthlySelectedDaysController.text);
    if(newAvailableDays > 30){
      _showDaysRangeValidation= true;
      notifyListeners();
      return false;
    }
    else{
      _availableDays = newAvailableDays;
      setMonthlySelectedDishModel();
      notifyListeners();
      return true;
    }
  }*/

  CartModel? get getFeedingPlan => _feedingPlan;

  void setDataToFeedingPlan({
    required var data,
  }) {
    _planType = data.planType;
    _quantity = data.recipes[0].quantity!;
/*
    _selectedDay = DateFormat('dd MMM yyyy').parse(cartData.deliveryDate);
*/
    if (_planType == Plans.monthly.text) {
      if (data.recipes.length == 1) {
        _monthlyEmptyTile1 = data.recipes[0];
      } else if (data.recipes.length == 2) {
        _monthlyEmptyTile1 = data.recipes[0];
        _monthlyEmptyTile2 = data.recipes[1];
      } else {
        _monthlyEmptyTile1 = data.recipes[0];
        _monthlyEmptyTile2 = data.recipes[1];
        _monthlyEmptyTile3 = data.recipes[2];
      }
    } else {
      _selectedRecipe = data.recipes.first;
    }

    setFeedingPlan(petData: data.pet, planDiscountPer: data.planDiscountPer);
  }

  void setFeedingPlan(
      {required PuppyModel? petData, required num planDiscountPer}) {
    final List<RecipeModel> recipeList = [];
    List<num> totalWeightData = [];
    List<String> pouchesData = [];
    if (_planType == Plans.monthly.text) {
      if (_monthlyEmptyTile1 != null) {
        recipeList.add(_monthlyEmptyTile1!);
      }
      if (_monthlyEmptyTile2 != null) {
        recipeList.add(_monthlyEmptyTile2!);
      }
      if (_monthlyEmptyTile3 != null) {
        recipeList.add(_monthlyEmptyTile3!);
      }
    } else if (_planType == Plans.transitional.text) {
      setTransitionalDishModel();
      recipeList.add(_selectedRecipe);
    }
    //TODO: REMOVE ONETIME ORDER
    /*else if (_planType == Plans.oneTime.text) {
      setOnTimeSelectedDishModel();
      recipeList.add(_selectedRecipe);
    }*/
    else {
      setProductModel();
      recipeList.add(_selectedRecipe);
    }

    if (_planType != Plans.product.text) {
      totalWeightData = calculateTotalWight(recipes: recipeList, pet: petData);
      pouchesData =
          generatePouchesDetailList(recipes: recipeList, pet: petData);
    }

    final num planTotalPrice = calculatePlanTotal(listOfItems: recipeList);

    final num planTotalDiscountedPrice = calculatePlanDiscount(
        planTotal: planTotalPrice, discountedPer: planDiscountPer);

    _feedingPlan = CartModel(
        planTotal: planTotalPrice,
        recipes: recipeList,
        pet: petData,
/*
        deliveryDate: '',
*/
        planType: _planType,
        pouchesDetail: pouchesData,
        totalWeight: totalWeightData,
        planDiscountedPrice: planTotalDiscountedPrice,
        planDiscountPer: planDiscountPer);

    notifyListeners();
  }

  List<num> calculateTotalWight(
      {required List<RecipeModel> recipes, PuppyModel? pet}) {
    List<num> totalWeight = [];
    for (var index = 0; index < recipes.length; index++) {
      final num totalPlanQuantity = calculateDailyIntake(
              recipeModel: recipes[index],
              puppyActivityLevel: pet!.activityLevel!,
              currentWeight: pet.currentWeight!,
              puppyActualWeight: pet.actualWeight!) *
          (recipes[index].totalDays!);
      final num transitionalPlanTotalQuantity = getTotalTransitionalGrams();
      final num weight = _planType == Plans.transitional.text
          ? transitionalPlanTotalQuantity
          : totalPlanQuantity;
      totalWeight.add(weight);
    }
    return totalWeight;
  }

  List<String> generatePouchesDetailList(
      {required List<RecipeModel> recipes, PuppyModel? pet}) {
    List<String> pouchesDetail = [];
    for (var index = 0; index < recipes.length; index++) {
      final num totalPlanQuantity = calculateDailyIntake(
              recipeModel: recipes[index],
              puppyActivityLevel: pet!.activityLevel!,
              currentWeight: pet.currentWeight!,
              puppyActualWeight: pet.actualWeight!) *
          (recipes[index].totalDays!);
      final num perPouchQuantity =
          calculateFeedingPlan(recipeModel: recipes[index], puppyModel: pet);
      final num transitional1to3PerPouchQty = calculateFeedingPlan(
          recipeModel: recipes[index],
          puppyModel: pet,
          gramsForTransitional: _transitionalGrams1to3Days);
      print(transitional1to3PerPouchQty);

      final num transitional4to6PerPouchQty = calculateFeedingPlan(
          recipeModel: recipes[index],
          puppyModel: pet,
          gramsForTransitional: _transitionalGrams4to6Days);
      print(transitional4to6PerPouchQty);

      final num transitional7to9PerPouchQty = calculateFeedingPlan(
          recipeModel: recipes[index],
          puppyModel: pet,
          gramsForTransitional: _transitionalGrams7to9Days);
      print(transitional7to9PerPouchQty);

      num transitional10thPerPouchQty = calculateFeedingPlan(
          recipeModel: recipes[index],
          puppyModel: pet,
          gramsForTransitional: _transitionalGrams10thDay);
      print(transitional10thPerPouchQty);

      if (_planType == Plans.transitional.text) {
        pouchesDetail.add(
            '${(_transitionalGrams1to3Days / transitional1to3PerPouchQty * 3).round()} pouches x ${(transitional1to3PerPouchQty / 3).toStringAsFixed(2)} grams (for days 1 to 3) | ${(_transitionalGrams4to6Days / transitional4to6PerPouchQty * 3).round()} pouches x ${(transitional4to6PerPouchQty / 3).toStringAsFixed(2)} grams (for days 4 to 6) | ${(_transitionalGrams7to9Days / transitional7to9PerPouchQty * 3).round()} pouches x ${(transitional7to9PerPouchQty / 3).toStringAsFixed(2)} grams (for days 7 to 9) | ${(_transitionalGrams10thDay / transitional10thPerPouchQty).round()} pouches x ${transitional10thPerPouchQty.toStringAsFixed(2)} grams (for day 10 onwards)');
      } else {
        pouchesDetail.add(
            '${(totalPlanQuantity / perPouchQuantity).round()} pouches x ${perPouchQuantity.toStringAsFixed(2)} grams for ${recipes[index].totalDays} days');
      }
    }
    return pouchesDetail;
  }

  num getTotalTransitionalGrams() {
    final num totalGrams = _transitionalGrams1to3Days +
        _transitionalGrams4to6Days +
        _transitionalGrams7to9Days +
        _transitionalGrams10thDay;
    return totalGrams.floor();
  }

  void setTransitionalDishModel() {
    _transitionalGrams1to3Days = calculateTransitionalGram(
        recipeModel: _selectedRecipe,
        percentage: 25,
        days: 3,
        calculatePrice: true);
    _transitionalGrams4to6Days = calculateTransitionalGram(
        recipeModel: _selectedRecipe,
        percentage: 50,
        days: 3,
        calculatePrice: true);
    _transitionalGrams7to9Days = calculateTransitionalGram(
        recipeModel: _selectedRecipe,
        percentage: 75,
        days: 3,
        calculatePrice: true);
    _transitionalGrams10thDay = calculateTransitionalGram(
        recipeModel: _selectedRecipe,
        percentage: 100,
        days: 1,
        calculatePrice: true);
    final num priceFor1to3Days = calculateTransitionalPrice(
        gramWithPercent: _transitionalGrams1to3Days,
        recipeModel: _selectedRecipe);
    final num priceFor4to6Days = calculateTransitionalPrice(
        gramWithPercent: _transitionalGrams4to6Days,
        recipeModel: _selectedRecipe);
    final num priceFor7to9Days = calculateTransitionalPrice(
        gramWithPercent: _transitionalGrams7to9Days,
        recipeModel: _selectedRecipe);
    final num priceFor10thDay = calculateTransitionalPrice(
        gramWithPercent: _transitionalGrams10thDay,
        recipeModel: _selectedRecipe);
    final RecipeModel applyDishDetail =
        RecipeModel.fromJson(_selectedRecipe.toJson());
    applyDishDetail.finalPrice = priceFor1to3Days +
        priceFor4to6Days +
        priceFor7to9Days +
        priceFor10thDay;
    _selectedRecipe = applyDishDetail;
  }

  void setProductModel() {
    final RecipeModel applyDishDetail =
        RecipeModel.fromJson(_selectedRecipe.toJson());
    applyDishDetail.quantity = _quantity;
    applyDishDetail.finalPrice = _selectedRecipe.pricePerKG! * _quantity;
    applyDishDetail.pricePerKG = _selectedRecipe.pricePerKG!;
    applyDishDetail.selectedItemSize = _selectedRecipe.selectedItemSize;
    applyDishDetail.sizes = _selectedRecipe.sizes;
    _selectedRecipe = applyDishDetail;
  }

  void setOnTimeSelectedDishModel() {
    final RecipeModel applyDishDetail =
        RecipeModel.fromJson(_selectedRecipe.toJson());
    applyDishDetail.totalDays = _daysCount;
    applyDishDetail.finalPrice =
        calculateFinalPricePerDay(recipeModel: _selectedRecipe) * _daysCount;
    _selectedRecipe = applyDishDetail;
  }

  void setMonthlySelectedItem() {
    final RecipeModel applyDishDetail =
        RecipeModel.fromJson(_selectedRecipe.toJson());
    applyDishDetail.totalDays = int.parse(_monthlySelectedDaysController.text);
    applyDishDetail.finalPrice =
        calculateFinalPricePerDay(recipeModel: _selectedRecipe) *
            int.parse(_monthlySelectedDaysController.text);
    if (_monthlyEmptyTileNumber == 1) {
      _monthlyEmptyTile1 = applyDishDetail;
    } else if (_monthlyEmptyTileNumber == 2) {
      _monthlyEmptyTile2 = applyDishDetail;
    } else {
      _monthlyEmptyTile3 = applyDishDetail;
    }
    notifyListeners();
  }

  void setProductCategory(String value) {
    _productCategory = value;
    _productsList = _recipesListResponse.data!.recipe!
        .where((element) => element.category! == _productCategory)
        .toList();
    notifyListeners();
  }

  void setRecipesListResponse(RecipesListResponse value) {
    _recipesListResponse = value;
    _productCategory = _recipesListResponse.data!.categories![0].name!;

    _recipesList = _recipesListResponse.data!.recipe!
        .where((element) => element.category!.isEmpty)
        .toList();
    _productsList = _recipesListResponse.data!.recipe!
        .where((element) => element.category! == _productCategory)
        .toList();
    _featuredRecipesList = _recipesListResponse.data!.recipe!
        .where((element) => element.category!.isEmpty && element.isFeatured!)
        .toList();
    setSelectedFeaturedRecipe(FeaturedRecipeType.adult.text);
    _featuredProductsList = _recipesListResponse.data!.recipe!
        .where((element) => element.category!.isNotEmpty && element.isFeatured!)
        .toList();
    _comboRecipesList = _recipesListResponse.data!.recipe!
        .where((element) => element.isComboRecipe == 1)
        .toList();
    _recommendedRecipesList = _recipesListResponse.data!.recipe!
        .where((element) => element.isComboRecipe == 0)
        .toList();
    _oneTimeRecipesList = _recipesListResponse.data!.recipe!
        .where((element) =>
            element.category == ProductCategories.standardRecipes.text)
        .toList();

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

    /*_selectedRecipe = RecipeModel(
        sId: value.sId,
        name: value.name,
        isFeatured: value.isFeatured,
        ingredient: value.ingredient,
        description: value.description,
        details: value.details,
        instructions: value.instructions,
        nutrition: value.nutrition,
        pricePerKG: value.price1,
        media: value.media,
        recipeNo: value.recipeNo,
        lifeStage: value.lifeStage,
        caloriesContentNo: value.caloriesContentNo,
        quantity: value.quantity,
        finalPrice: value.finalPrice,
        isComboRecipe: value.isComboRecipe,
        sizes: value.sizes,
        selectedItemSize: value.selectedItemSize,
        totalDays: value.totalDays,
        category: value.category,
        ingredientsComposition: value.ingredientsComposition);*/
    /* if(_selectedRecipe.sizes!.isNotEmpty){
      _selectedItemSize = _selectedRecipe.sizes![0];
    }
    else{
      _selectedItemSize = null;
    }*/
    notifyListeners();
  }

  TextEditingController get getMonthlySelectedDaysController =>
      _monthlySelectedDaysController;

  RecipeModel? get getMonthlyEmptyTile1 => _monthlyEmptyTile1;

  RecipeModel? get getMonthlyEmptyTile2 => _monthlyEmptyTile2;

  RecipeModel? get getMonthlyEmptyTile3 => _monthlyEmptyTile3;

  String get getPlanType => _planType;

  void setPlanType(String value) {
    _planType = value;
    notifyListeners();
  }

  void clearPlanData() {
/*
    _selectedItemSize = null;
*/
    _quantity = 1;
    _daysCount = 1;
    _availableDays = 0;
    _monthlySelectedDaysController.clear();
    _monthlyEmptyTileNumber = 1;
    _monthlyEmptyTile1 = null;
    _monthlyEmptyTile2 = null;
    _monthlyEmptyTile3 = null;

    notifyListeners();
  }

  Future<bool> callAllRecipesApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final RecipesListResponse response = await _planApiServices.allRecipes();
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
