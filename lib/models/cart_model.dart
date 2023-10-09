import 'package:brunos_kitchen/models/puppy_model.dart';

import 'recipe_model.dart';

class CartModel {
  PuppyModel? pet;
  List<RecipeModel> recipes;
/*
  String deliveryDate;
*/
  String planType;
  num planTotal;
  CartModel({required this.planTotal,required this.recipes,required this.pet, /*required this.deliveryDate,*/required this.planType});
}