class AddressModel {
  int? id;
  int? addressType;
  String? fullAddress;
  String? nearbyLocations;
  String? lat;
  String? long;
  bool? isDefault;

  AddressModel(
      {this.id,
        this.addressType,
        this.fullAddress,
        this.nearbyLocations,
        this.lat,
        this.long,
        this.isDefault});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'];
    fullAddress = json['full_address'];
    nearbyLocations = json['nearby_locations'];
    lat = json['lat'];
    long = json['long'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_type'] = this.addressType;
    data['full_address'] = this.fullAddress;
    data['nearby_locations'] = this.nearbyLocations;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['is_default'] = this.isDefault;
    return data;
  }
}