import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/responses/faqs_blogs_news_response.dart';

import '../recipe_model.dart';

class RecipesListResponse extends BaseResponseModel{
  AllData? data;


  RecipesListResponse(
      {super.isSuccess, this.data, super.message});

  RecipesListResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? AllData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}


class AllData {
  List<Categories>? categories;
  List<RecipeModel>? recipe;
  List<FaqsBlogsNewsData>? faqs;

  AllData({this.categories, this.recipe, this.faqs});

  AllData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['recipe'] != null) {
      recipe = <RecipeModel>[];
      json['recipe'].forEach((v) {
        recipe!.add(RecipeModel.fromJson(v));
      });
    }
    if (json['faqs'] != null) {
      faqs = <FaqsBlogsNewsData>[];
      json['faqs'].forEach((v) {
        faqs!.add(FaqsBlogsNewsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (recipe != null) {
      data['recipe'] = recipe!.map((v) => v.toJson()).toList();
    }
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? sId;
  int? createdOnDate;
  String? name;

  Categories({this.sId, this.createdOnDate, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['createdOnDate'] = createdOnDate;
    data['name'] = name;
    return data;
  }
}

