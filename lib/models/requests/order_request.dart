import '../item_sizes_model.dart';
import '../puppy_model.dart';

class OrderRequest {
  int? totalAmount;
  String? locationId;
  String? paymentMethod;
  int? discountPercentage;
  String? deliveryDate;
  String? promoCodeId;
  List<OrderItems>? orderItems;

  OrderRequest(
      {this.totalAmount,
        this.locationId,
        this.paymentMethod,
        this.discountPercentage,
        this.deliveryDate,
        this.promoCodeId,
        this.orderItems});

  OrderRequest.fromJson(Map<String, dynamic> json) {
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
  PuppyModel? pet;
  Recipe? recipe;

  OrderItems({this.pet, this.recipe});

  OrderItems.fromJson(Map<String, dynamic> json) {
    pet = json['pet'] != null ? new PuppyModel.fromJson(json['pet']) : null;
    recipe =
    json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pet != null) {
      data['pet'] = this.pet!.toJson();
    }
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    return data;
  }
}


class Recipe {
  String? id;
  int? finalPrice;
  int? totalDays;
  int? quantity;
  ItemSizes? itemSizes;

  Recipe(
      {this.id,
        this.finalPrice,
        this.totalDays,
        this.quantity,
        this.itemSizes});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    finalPrice = json['finalPrice'];
    totalDays = json['totalDays'];
    quantity = json['quantity'];
    itemSizes = json['itemSizes'] != null
        ? new ItemSizes.fromJson(json['itemSizes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['finalPrice'] = this.finalPrice;
    data['totalDays'] = this.totalDays;
    data['quantity'] = this.quantity;
    if (this.itemSizes != null) {
      data['itemSizes'] = this.itemSizes!.toJson();
    }
    return data;
  }
}

