import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/responses/faqs_blogs_news_response.dart';

import '../recipe_model.dart';

class RecipesListResponse extends BaseResponseModel{
  AllData? data;


  RecipesListResponse(
      {super.isSuccess, this.data, super.message});

  RecipesListResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new AllData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
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
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['recipe'] != null) {
      recipe = <RecipeModel>[];
      json['recipe'].forEach((v) {
        recipe!.add(new RecipeModel.fromJson(v));
      });
    }
    if (json['faqs'] != null) {
      faqs = <FaqsBlogsNewsData>[];
      json['faqs'].forEach((v) {
        faqs!.add(new FaqsBlogsNewsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.map((v) => v.toJson()).toList();
    }
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['name'] = this.name;
    return data;
  }
}

