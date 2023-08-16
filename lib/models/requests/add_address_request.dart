class AddAddressRequest {
  List<String> coordinates;
  String address;
  String label;
  bool isDefault;
  String flatHouseNumber;

  AddAddressRequest(
      {required this.coordinates,
        required this.address,
        required this.label,
        required this.isDefault,
        required this.flatHouseNumber});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['address'] = this.address;
    data['label'] = this.label;
    data['isDefault'] = this.isDefault;
    data['flatHouseNumber'] = this.flatHouseNumber;
    return data;
  }
}