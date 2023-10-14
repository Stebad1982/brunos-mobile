import 'package:brunos_kitchen/models/base_response_model.dart';

import '../puppy_model.dart';
import '../recipe_model.dart';

class OrderResponse extends BaseResponseModel {
  List<OrderData>? data;

  OrderResponse({super.isSuccess, this.data, super.message});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(new OrderData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class OrderData {
  String? sId;
  int? totalAmount;
  String? locationId;
  String? paymentMethod;
  int? discountPercentage;
  String? deliveryDate;
  String? promoCodeId;
  List<OrderItems>? orderItems;

  OrderData(
      {this.sId,
      this.totalAmount,
      this.locationId,
      this.paymentMethod,
      this.discountPercentage,
      this.deliveryDate,
      this.promoCodeId,
      this.orderItems});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalAmount = json['totalAmount'];
    locationId = json['locationId'];
    paymentMethod = json['paymentMethod'];
    discountPercentage = json['discountPercentage'];
    deliveryDate = json['deliveryDate'];
    promoCodeId = json['promoCodeId'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['totalAmount'] = this.totalAmount;
    data['locationId'] = this.locationId;
    data['paymentMethod'] = this.paymentMethod;
    data['discountPercentage'] = this.discountPercentage;
    data['deliveryDate'] = this.deliveryDate;
    data['promoCodeId'] = this.promoCodeId;
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  List<RecipeModel>? recipes;
  PuppyModel? pet;
  String? planType;
  num? planTotal;

  OrderItems({this.recipes, this.pet, this.planType, this.planTotal});

  OrderItems.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <RecipeModel>[];
      json['recipes'].forEach((v) {
        recipes!.add(new RecipeModel.fromJson(v));
      });
    }
    pet = json['pet'] != null ? new PuppyModel.fromJson(json['pet']) : null;
    planType = json['planType'];
    planTotal = json['planTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    if (this.pet != null) {
      data['pet'] = this.pet!.toJson();
    }
    data['planTotal'] = this.planTotal;
    data['planType'] = planType;
    return data;
  }
}
