import 'package:brunos_kitchen/models/puppy_model.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';

class OrderData {
  String? sId;
  int? totalAmount;
  String? locationId;
  String? paymentMethod;
  int? discountPercentage;
  String? deliveryDate;
  String? promoCodeId;
  bool? isCompleted;
  num? shippingFees;
  num? cartTotal;
  List<OrderItems>? orderItems;

  OrderData(
      {this.sId,
        this.totalAmount,
        this.locationId,
        this.paymentMethod,
        this.discountPercentage,
        this.deliveryDate,
        this.promoCodeId,
        this.cartTotal,
        this.shippingFees,
        this.isCompleted,
        this.orderItems});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalAmount = json['totalAmount'];
    locationId = json['locationId'];
    paymentMethod = json['paymentMethod'];
    discountPercentage = json['discountPercentage'];
    deliveryDate = json['deliveryDate'];
    cartTotal = json['cartTotal'];
    shippingFees = json['shippingFees'];
    isCompleted = json['isCompleted'];
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
    data['shippingFees'] = this.shippingFees;
    data['isCompleted'] = this.isCompleted;
    data['isCompleted'] = this.isCompleted;
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
