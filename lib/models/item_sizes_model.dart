class ItemSizes {
  String? name;
  num? price;
  int? stock;
  int? weight;
  String? unit;
  String? image;

  ItemSizes({this.name, this.price, this.stock, this.weight, this.unit});

  ItemSizes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    stock = json['stock'];
    weight = json['weight'];
    unit = json['unit'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['stock'] = stock;
    data['weight'] = weight;
    data['unit'] = unit;
    data['image'] = image;
    return data;
  }
}