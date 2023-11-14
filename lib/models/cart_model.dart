import 'dart:convert';

import 'package:brunos_kitchen/models/puppy_model.dart';

import 'recipe_model.dart';

class CartModel {
  PuppyModel? pet;
  List<RecipeModel> recipes;
  String planType;
  List<String> pouchesDetail;
  num planTotal;

  CartModel(
      {required this.planTotal,
      required this.recipes,
      required this.pet,
        required  this.pouchesDetail,
      required this.planType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pet != null) {
      data['pet'] = this.pet!.toJson();
    }
    data['pouchesDetail'] = this.pouchesDetail;
    data['planType'] = this.planType;
    data['planTotal'] = this.planTotal;
    data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
      return data;
  }
}



