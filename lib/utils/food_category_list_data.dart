import 'package:brunos_kitchen/utils/images.dart';

class FoodCategory {
  String? image;
  String? name;

  FoodCategory(this.name, this.image);
}

List<FoodCategory> foodCategoryList = [
  FoodCategory('Freshly Cooked', freshlyCooked),
  FoodCategory('Exclusive Nutrient Blends', wellBalancedNutrientBlend),
  FoodCategory('Doorstep Delivery', doorstepDelivery),
  FoodCategory('Long Shelf Life', longShelfLife),
  FoodCategory('Human Grade Ingredients', humanGradeIngredients),
  FoodCategory('AAFCO Compliant', aafcoCompliant),
  FoodCategory('Customized Meals', customizedMeals),
  FoodCategory('Vet Developed', vetDeveloped)
];



