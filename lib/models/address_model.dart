class AddressModel {
  String? sId;
  int? createdOnDate;
  String? type;
  List<String>? coordinates;
  String? address;
  String? label;
  bool? isDefault;
  String? userId;
  String? flatHouseNumber;

  AddressModel(
      {this.sId,
        this.createdOnDate,
        this.type,
        this.coordinates,
        this.address,
        this.label,
        this.isDefault,
        this.userId,
        this.flatHouseNumber});

  AddressModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    type = json['type'];
    coordinates = json['coordinates'].cast<String>();
    address = json['address'];
    label = json['label'];
    isDefault = json['isDefault'];
    userId = json['userId'];
    flatHouseNumber = json['flatHouseNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['address'] = this.address;
    data['label'] = this.label;
    data['isDefault'] = this.isDefault;
    data['userId'] = this.userId;
    data['flatHouseNumber'] = this.flatHouseNumber;
    return data;
  }
}