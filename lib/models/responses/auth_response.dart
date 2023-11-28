import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/card_model.dart';

import '../address_model.dart';
import '../puppy_model.dart';

class AuthResponse extends BaseResponseModel{
  AuthData? data;

  AuthResponse({super.isSuccess, this.data, super.message});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new AuthData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class AuthData {
  String? sId;
  int? createdOnDate;
  String? fullName;
  String? email;
  String? phoneNumber;
  bool? isVerified;
  bool? isGuest;
  CardModel? card;
  int? availablePoints;
  String? media;
  int? petsCount;
  PuppyModel? pet;
  AddressModel? location;
  String? refreshToken;
  String? clientToken;
  List<Discounts>? discounts;

  AuthData(
      {this.sId,
        this.createdOnDate,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.isVerified,
        this.media,
        this.petsCount,
        this.pet,
        this.card,
        this.isGuest,
        this.location,
        this.availablePoints,
        this.refreshToken,
        this.discounts,
        this.clientToken});

  AuthData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isVerified = json['isVerified'];
    media = json['media'];
    isGuest = json['isGuest'];
    card = json['card'] != null ? CardModel.fromJson(json['card']) : null;
    availablePoints = (json['availablePoints']).round();
    petsCount = json['petsCount'];
    pet = json['pet'] != null ? PuppyModel.fromJson(json['pet']) : null;
    location = json['location'] != null
        ? AddressModel.fromJson(json['location'])
        : null;
    refreshToken = json['refreshToken'];
    clientToken = json['clientToken'];
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Discounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['isGuest'] = this.isGuest;
    data['phoneNumber'] = this.phoneNumber;
    data['isVerified'] = this.isVerified;
    data['availablePoints'] = this.availablePoints;
    data['media'] = this.media;
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    data['petsCount'] = this.petsCount;
    if (this.pet != null) {
      data['pet'] = this.pet!.toJson();
    }
    data['refreshToken'] = this.refreshToken;
    data['clientToken'] = this.clientToken;
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Discounts {
  String? sId;
  int? createdOnDate;
  int? aggregate;
  String? name;

  Discounts({this.sId, this.createdOnDate, this.aggregate, this.name});

  Discounts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    aggregate = json['aggregate'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['aggregate'] = this.aggregate;
    data['name'] = this.name;
    return data;
  }


}
