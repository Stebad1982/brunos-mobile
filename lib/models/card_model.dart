class CardModel {
  String? sId;
  bool? isDefault;
  String? brand;
  String? paymentMethodId;
  int? expMonth;
  int? expYear;
  String? last4;

  CardModel(
      {this.sId,
      this.isDefault,
      this.brand,
      this.paymentMethodId,
      this.expMonth,
      this.expYear,
      this.last4});

  CardModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDefault = json['isDefault'];
    brand = json['brand'];
    paymentMethodId = json['paymentMethodId'];
    expMonth = json['expMonth'];
    expYear = json['expYear'];
    last4 = json['last4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['isDefault'] = isDefault;
    data['brand'] = brand;
    data['paymentMethodId'] = paymentMethodId;
    data['expMonth'] = expMonth;
    data['expYear'] = expYear;
    data['last4'] = last4;
    return data;
  }
}
