class ItemSizes {
  String? name;
  int? price;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['weight'] = this.weight;
    data['unit'] = this.unit;
    data['image'] = this.image;
    return data;
  }
}