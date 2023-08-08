import 'package:brunos_kitchen/models/base_response_model.dart';

class PuppiesResponse extends BaseResponseModel{
  List<PuppiesData>? data;
  bool? isServerError;

  PuppiesResponse(
      {super.isSuccess, this.data, this.isServerError, super.message});

  PuppiesResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <PuppiesData>[];
      json['data'].forEach((v) {
        data!.add(new PuppiesData.fromJson(v));
      });
    }
    isServerError = json['isServerError'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isServerError'] = this.isServerError;
    data['message'] = this.message;
    return data;
  }
}

class PuppiesData {
  String? sId;
  int? createdOnDate;
  String? name;
  String? media;
  bool? isSpayNeuter;
  String? breed;
  int? bornOnDate;
  int? currentWeight;
  int? actualWeight;
  String? activityLevel;
  User? user;

  PuppiesData(
      {this.sId,
        this.createdOnDate,
        this.name,
        this.media,
        this.isSpayNeuter,
        this.breed,
        this.bornOnDate,
        this.currentWeight,
        this.actualWeight,
        this.activityLevel,
        this.user});

  PuppiesData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    name = json['name'];
    media = json['media'];
    isSpayNeuter = json['isSpayNeuter'];
    breed = json['breed'];
    bornOnDate = json['bornOnDate'];
    currentWeight = json['currentWeight'];
    actualWeight = json['actualWeight'];
    activityLevel = json['activityLevel'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['name'] = this.name;
    data['media'] = this.media;
    data['isSpayNeuter'] = this.isSpayNeuter;
    data['breed'] = this.breed;
    data['bornOnDate'] = this.bornOnDate;
    data['currentWeight'] = this.currentWeight;
    data['actualWeight'] = this.actualWeight;
    data['activityLevel'] = this.activityLevel;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? email;
  String? media;

  User({this.sId, this.fullName, this.email, this.media});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['media'] = this.media;
    return data;
  }
}