class AddAddressRequest {
  List<String> coordinates;
  String address;
  String label;
  bool isDefault;
  String street;
  String area;
  String floor;
  String deliveryInstruction;
  String contactName;
  String contactNumber;
  String flatHouseNumber;

  AddAddressRequest(
      {required this.coordinates,
      required this.address,
      required this.label,
      required this.isDefault,
      required this.street,
      required this.area,
      required this.floor,
      required this.deliveryInstruction,
      required this.flatHouseNumber,
      required this.contactName,
      required this.contactNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['address'] = this.address;
    data['label'] = this.label;
    data['isDefault'] = this.isDefault;
    data['street'] = this.street;
    data['area'] = this.area;
    data['floor'] = this.floor;
    data['deliveryInstruction'] = this.deliveryInstruction;
    data['flatHouseNumber'] = this.flatHouseNumber;
    data['contactNumber'] = this.contactNumber;
    data['contactName'] = this.contactName;
    return data;
  }
}
