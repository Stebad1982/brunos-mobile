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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDefault'] = this.isDefault;
    data['brand'] = this.brand;
    data['paymentMethodId'] = this.paymentMethodId;
    data['expMonth'] = this.expMonth;
    data['expYear'] = this.expYear;
    data['last4'] = this.last4;
    return data;
  }
}
