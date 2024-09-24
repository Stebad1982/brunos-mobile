class CustomPricesModel {
  num? weight;
  String? activityLevel;
  num? price;

  CustomPricesModel({this.weight, this.activityLevel, this.price});

  CustomPricesModel.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
    activityLevel = json['activityLevel'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weight'] = weight;
    data['activityLevel'] = activityLevel;
    data['price'] = price;
    return data;
  }
}