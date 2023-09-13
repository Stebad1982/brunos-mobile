import 'dart:convert';

import 'ingredient_model.dart';

class RecipeModel {
  String? sId;
  int? createdOnDate;
  String? name;
  bool? isFeatured;
  String? userId;
  List<Ingredient>? ingredient;
  String? description;
  String? details;
  String? instructions;
  List<String>? nutrition;
  int? pricePerKG;
  String? media;
  String? recipeNo;
  String? lifeStage;
  int? totalDays;
  int? caloriesContentNo;

  //Ingredient? ingredients;
  String? ingredientsComposition;

  RecipeModel(
      {this.sId,
      this.createdOnDate,
      this.name,
      this.isFeatured,
      this.userId,
      this.ingredient,
      this.description,
      this.details,
      this.instructions,
      this.nutrition,
      this.pricePerKG,
      this.media,
      this.recipeNo,
      this.lifeStage,
      this.caloriesContentNo,
      // this.ingredients,
      this.totalDays,
      this.ingredientsComposition});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    name = json['name'];
    isFeatured = json['isFeatured'];
    userId = json['userId'];
    if (json['ingredient'] != null) {
      ingredient = <Ingredient>[];
      json['ingredient'].forEach((v) {
        ingredient!.add(new Ingredient.fromJson(v));
      });
    }
    description = json['description'];
    totalDays = json['totalDays'] ?? 1;
    details = json['details'];
    instructions = json['instructions'];
    nutrition = json['nutrition'].split(",");
    pricePerKG = json['pricePerKG'];
    media = json['media'];
    recipeNo = json['recipeNo'];
    lifeStage = json['lifeStage'];
    caloriesContentNo = json['caloriesContentNo'];
    //  ingredients = json['ingredients'];
    ingredientsComposition = json['ingredientsComposition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['name'] = this.name;
    data['isFeatured'] = this.isFeatured;
    data['userId'] = this.userId;
    data['totalDays'] = this.totalDays ?? 1;
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient!.map((v) => v.toJson()).toList();
    }
    if (this.nutrition != null) {
      data['nutrition'] = jsonEncode(this.nutrition);
    }
    data['description'] = this.description;
    data['details'] = this.details;
    data['instructions'] = this.instructions;
   // data['nutrition'] = this.nutrition;
    data['pricePerKG'] = this.pricePerKG;
    data['media'] = this.media;
    data['recipeNo'] = this.recipeNo;
    data['lifeStage'] = this.lifeStage;
    data['caloriesContentNo'] = this.caloriesContentNo;
    //  data['ingredients'] = this.ingredients;
    data['ingredientsComposition'] = this.ingredientsComposition;
    return data;
  }
}
