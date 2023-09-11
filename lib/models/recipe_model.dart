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
  String? nutrition;
  int? pricePerKG;
  String? media;
  String? recipeNo;
  String? lifeStage;
  int? caloriesContentNo;
  int? qty;
  int? totalDays;

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
      this.qty,
      this.totalDays});

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
    details = json['details'];
    instructions = json['instructions'];
    nutrition = json['nutrition'];
    pricePerKG = json['pricePerKG'];
    media = json['media'];
    recipeNo = json['recipeNo'];
    lifeStage = json['lifeStage'];
    caloriesContentNo = json['caloriesContentNo'];
    qty = json['qty']??1;
    totalDays = json['totalDays']??1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['name'] = this.name;
    data['isFeatured'] = this.isFeatured;
    data['userId'] = this.userId;
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['details'] = this.details;
    data['instructions'] = this.instructions;
    data['nutrition'] = this.nutrition;
    data['pricePerKG'] = this.pricePerKG;
    data['media'] = this.media;
    data['recipeNo'] = this.recipeNo;
    data['lifeStage'] = this.lifeStage;
    data['caloriesContentNo'] = this.caloriesContentNo;
    data['qty']= this.qty??1;
    data['totalDays'] = this.totalDays??1;
    return data;
  }
}
