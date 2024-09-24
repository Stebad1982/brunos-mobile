class Ingredient {
  String? name;
  num? aggregate;

  Ingredient({this.name, this.aggregate});

  Ingredient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    aggregate = json['aggregate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['aggregate'] = aggregate;
    return data;
  }
}