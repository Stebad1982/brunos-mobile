class AddressRadiusResponse {
  bool? withinRadius;
  double? distance;

  AddressRadiusResponse({this.withinRadius, this.distance});

  AddressRadiusResponse.fromJson(Map<String, dynamic> json) {
    withinRadius = json['withinRadius'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['withinRadius'] = this.withinRadius;
    data['distance'] = this.distance;
    return data;
  }
}