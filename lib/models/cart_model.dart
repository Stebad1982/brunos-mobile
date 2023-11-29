import 'dart:convert';

import 'package:brunos_kitchen/models/puppy_model.dart';

import 'recipe_model.dart';

class CartModel {
  PuppyModel? pet;
  List<RecipeModel> recipes;
  String planType;
  List<num> totalWeight;
  List<String> pouchesDetail;
  num planTotal;
  num planDiscountPer;
  num planDiscountedPrice;

  CartModel(
      {required this.planTotal,
      required this.recipes,
      required this.pet,
      required this.pouchesDetail,
      required this.planType,
        required this.planDiscountPer,
      required this.planDiscountedPrice,
      required this.totalWeight});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pet != null) {
      data['pet'] = this.pet!.toJson();
    }
    data['pouchesDetail'] = this.pouchesDetail;
    data['planType'] = this.planType;
    data['planTotal'] = this.planTotal;
    data['planDiscountPer'] = this.planDiscountPer;
    data['planDiscountedPrice'] = this.planDiscountedPrice;
    data['totalWeight'] = this.totalWeight;
    data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    return data;
  }
}
