class ItemSizes {
  String? name;
  int? price;
  int? stock;

  ItemSizes({this.name, this.price, this.stock});

  ItemSizes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['stock'] = this.stock;
    return data;
  }
}