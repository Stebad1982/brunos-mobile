import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/card_model.dart';

import '../address_model.dart';
import '../puppy_model.dart';

class AuthResponse extends BaseResponseModel {
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
  List<Greetings>? greetings;

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
      this.clientToken,
      this.greetings});

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
    if (json['greetings'] != null) {
      greetings = <Greetings>[];
      json['greetings'].forEach((v) {
        greetings!.add(new Greetings.fromJson(v));
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
    if (this.greetings != null) {
      data['greetings'] = this.greetings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Discounts {
  String? sId;
  num? createdOnDate;
  num? aggregate;
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

class Greetings {
  String? sId;
  int? createdOnDate;
  String? title;
  String? description;
  String? type;
  List<String>? media;
  String? userId;
  bool? isFeatured;
  bool? isReplied;

  Greetings(
      {this.sId,
      this.createdOnDate,
      this.title,
      this.description,
      this.type,
      this.media,
      this.userId,
      this.isFeatured,
      this.isReplied});

  Greetings.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    media = json['media'].cast<String>();
    userId = json['userId'];
    isFeatured = json['isFeatured'];
    isReplied = json['isReplied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['media'] = this.media;
    data['userId'] = this.userId;
    data['isFeatured'] = this.isFeatured;
    data['isReplied'] = this.isReplied;
    return data;
  }
}
