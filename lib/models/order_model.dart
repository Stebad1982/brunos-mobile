import 'package:brunos_kitchen/models/puppy_model.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';

class OrderData {
  String? sId;
  num? totalAmount;
  String? locationId;
  String? paymentMethod;
  num? discount;
  num? vat;
  String? deliveryDate;
  num? createdOnDate;
  String? promoCodeId;
  bool? isCompleted;
  num? shippingFees;
  num? cartTotal;
  num? pointsEarned;
  List<OrderItems>? orderItems;

  OrderData(
      {this.sId,
        this.totalAmount,
        this.locationId,
        this.paymentMethod,
        this.discount,
        this.deliveryDate,
        this.promoCodeId,
        this.cartTotal,
        this.vat,
        this.createdOnDate,
        this.shippingFees,
        this.isCompleted,
        this.pointsEarned,
        this.orderItems});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalAmount = json['totalAmount'];
    locationId = json['locationId'];
    paymentMethod = json['paymentMethod'];
    discount = json['discount'];
    deliveryDate = json['deliveryDate'];
    cartTotal = json['cartTotal'];
    createdOnDate = json['createdOnDate'];
    shippingFees = json['shippingFees'];
    isCompleted = json['isCompleted'];
    promoCodeId = json['promoCodeId'];
    vat = json['vat'];
    pointsEarned = json['pointsEarned'];
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
    data['discount'] = this.discount;
    data['deliveryDate'] = this.deliveryDate;
    data['shippingFees'] = this.shippingFees;
    data['isCompleted'] = this.isCompleted;
    data['isCompleted'] = this.isCompleted;
    data['vat'] = this.vat;
    data['pointsEarned'] = this.pointsEarned;
    data['promoCodeId'] = this.promoCodeId;
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  PuppyModel? pet;
  List<String>? pouchesDetail;
  String? planType;
  num? planTotal;
  num? planDiscountPer;
  num? planDiscountedPrice;
  List<num>? totalWeight;
  List<RecipeModel>? recipes;

  OrderItems({this.pet,
    this.pouchesDetail,
    this.planType,
    this.planTotal,
    this.planDiscountPer,
    this.planDiscountedPrice,
    this.totalWeight,
    this.recipes});

  OrderItems.fromJson(Map<String, dynamic> json) {
    pet = json['pet'] != null ? new PuppyModel.fromJson(json['pet']) : null;
    pouchesDetail = json['pouchesDetail'].cast<String>();
    planType = json['planType'];
    planTotal = json['planTotal'];
    planDiscountPer = json['planDiscountPer'];
    planDiscountedPrice = json['planDiscountedPrice'];
    totalWeight = json['totalWeight'].cast<int>();
    if (json['recipes'] != null) {
      recipes = <RecipeModel>[];
      json['recipes'].forEach((v) {
        recipes!.add(new RecipeModel.fromJson(v));
      });
    }
  }

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
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
