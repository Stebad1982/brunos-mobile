import 'package:brunos_kitchen/models/puppy_model.dart';

import 'recipe_model.dart';

class CartModel {
  PuppyModel puppy;
  List<RecipeModel> recipe;
  String deliveryDate;
  String planType;
  CartModel({required this.recipe,required this.puppy, required this.deliveryDate,required this.planType});
}