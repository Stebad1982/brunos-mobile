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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordinates'] = coordinates;
    data['address'] = address;
    data['label'] = label;
    data['isDefault'] = isDefault;
    data['street'] = street;
    data['area'] = area;
    data['floor'] = floor;
    data['deliveryInstruction'] = deliveryInstruction;
    data['flatHouseNumber'] = flatHouseNumber;
    data['contactNumber'] = contactNumber;
    data['contactName'] = contactName;
    return data;
  }
}
