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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    data['activityLevel'] = this.activityLevel;
    data['price'] = this.price;
    return data;
  }
}