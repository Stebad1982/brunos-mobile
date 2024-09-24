

class PuppyModel {
  String? sId;
  int? createdOnDate;
  String? name;
  String? gender;
  String? media;
  bool? isSpayNeuter;
  String? breed;

  // int? bornOnDate;
  int? month;
  int? year;
  int? currentWeight;
  int? actualWeight;
  bool? isPuppy;
  bool? isDefault;
  int? feedingRoutine;
  String? activityLevel;

  PuppyModel(
      {this.sId,
      this.createdOnDate,
      this.name,
      this.media,
      this.isSpayNeuter,
      this.breed,
      this.gender,
      //this.bornOnDate,
      this.feedingRoutine,
      this.currentWeight,
      this.actualWeight,
      this.activityLevel,
      this.isDefault,
      this.month,
      this.year,
      this.isPuppy});

  PuppyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    name = json['name'];
    media = json['media'];
    isSpayNeuter = json['isSpayNeuter'];
    breed = json['breed'];
    gender = json['gender'];
    month = json['month'];
    year = json['year'];
    isPuppy = json['isPuppy'];
    //bornOnDate = json['bornOnDate'];
    currentWeight = json['currentWeight'];
    actualWeight = json['actualWeight'];
    isDefault = json['isDefault'];
    feedingRoutine = json['feedingRoutine'] ?? 1;
    activityLevel = json['activityLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['createdOnDate'] = createdOnDate;
    data['name'] = name;
    data['media'] = media;
    data['isSpayNeuter'] = isSpayNeuter;
    data['breed'] = breed;
    data['month'] = month;
    data['year'] = year;
    data['isPuppy'] = isPuppy;
    data['month'] = month;
    data['year'] = year;
    data['isPuppy'] = isPuppy;
    //data['bornOnDate'] = this.bornOnDate;
    data['currentWeight'] = currentWeight;
    data['actualWeight'] = actualWeight;
    data['isDefault'] = isDefault;
    data['feedingRoutine'] = feedingRoutine;
    data['activityLevel'] = activityLevel;
    return data;
  }
}
