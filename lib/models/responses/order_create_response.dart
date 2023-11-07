class OrderCreateResponse {
  bool? isSuccess;
  Data? data;
  String? message;

  OrderCreateResponse({this.isSuccess, this.data, this.message});

  OrderCreateResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? sId;
  int? totalAmount;
  String? locationId;
  String? paymentMethod;
  int? discountPercentage;
  String? deliveryDate;
  String? promoCodeId;

  Data(
      {this.sId,
        this.totalAmount,
        this.locationId,
        this.paymentMethod,
        this.discountPercentage,
        this.deliveryDate,
        this.promoCodeId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalAmount = json['totalAmount'];
    locationId = json['locationId'];
    paymentMethod = json['paymentMethod'];
    discountPercentage = json['discountPercentage'];
    deliveryDate = json['deliveryDate'];
    promoCodeId = json['promoCodeId'];
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
    return data;
  }
}