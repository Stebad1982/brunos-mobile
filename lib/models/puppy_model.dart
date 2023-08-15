import 'package:brunos_kitchen/models/responses/puppies_response.dart';

import '../utils/enums.dart';

class PuppyModel {
  String? sId;
  int? createdOnDate;
  String? name;
  String? gender;
  String? media;
  bool? isSpayNeuter;
  String? breed;
  int? bornOnDate;
  int? currentWeight;
  int? actualWeight;
  String? activityLevel;

  PuppyModel({
    this.sId,
    this.createdOnDate,
    this.name,
    this.media,
    this.isSpayNeuter,
    this.breed,
    this.gender,
    this.bornOnDate,
    this.currentWeight,
    this.actualWeight,
    this.activityLevel,
  });

  PuppyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    name = json['name'];
    media = json['media'];
    isSpayNeuter = json['isSpayNeuter'];
    breed = json['breed'];
    gender = json['gender'];
    bornOnDate = json['bornOnDate'];
    currentWeight = json['currentWeight'];
    actualWeight = json['actualWeight'];
    activityLevel = json['activityLevel'];
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
    return data;
  }
}
