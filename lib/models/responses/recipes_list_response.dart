import '../recipe_model.dart';

class RecipesListResponse {
  bool? isSuccess;
  List<RecipeModel>? data;
  bool? isServerError;
  String? message;

  RecipesListResponse(
      {this.isSuccess, this.data, this.isServerError, this.message});

  RecipesListResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <RecipeModel>[];
      json['data'].forEach((v) {
        data!.add(new RecipeModel.fromJson(v));
      });
    }
    isServerError = json['isServerError'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isServerError'] = this.isServerError;
    data['message'] = this.message;
    return data;
  }
}


