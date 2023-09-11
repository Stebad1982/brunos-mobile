import 'package:brunos_kitchen/models/base_response_model.dart';

import '../recipe_model.dart';

class RecipesListResponse extends BaseResponseModel{
  List<RecipeModel>? data;
  bool? isServerError;

  RecipesListResponse(
      {super.isSuccess, this.data, this.isServerError, super.message});

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


