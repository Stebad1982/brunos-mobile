import 'package:brunos_kitchen/models/puppy_model.dart';

import 'recipe_model.dart';

class CartModel {
  PuppyModel? pet;
  List<RecipeModel> recipes;
  String planType;
  num planTotal;

  CartModel(
      {required this.planTotal,
      required this.recipes,
      required this.pet,
      required this.planType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pet'] = pet!.toJson();
    data['recipes'] = recipes.map((v) => v.toJson()).toList();
    return data;
  }
}
