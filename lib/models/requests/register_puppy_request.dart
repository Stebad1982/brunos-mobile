class RegisterPuppyRequest {
  String name;
  String media;
  String gender;
  int feedingRoutine;

  // bool isSpayNeuter;
  String breed;

  // int bornOnDate;
  int currentWeight;
  int actualWeight;
  String activityLevel;
  bool isPuppy;
  int month;
  int year;

  RegisterPuppyRequest(
      {required this.name,
      required this.media,
      required this.gender,
      required this.feedingRoutine,
      // required this.isSpayNeuter,
      required this.breed,
      // required this.bornOnDate,
      required this.currentWeight,
      required this.actualWeight,
      required this.activityLevel,
      required this.isPuppy,
      required this.month,
      required this.year});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['media'] = media;
    data['gender'] = gender;
    data['feedingRoutine'] = feedingRoutine;
    data['month'] = month;
    data['year'] = year;
    data['isPuppy'] = isPuppy;
    data['isSpayNeuter'] = false;
    data['breed'] = breed;
    // data['bornOnDate'] = this.bornOnDate;
    data['currentWeight'] = currentWeight;
    data['actualWeight'] = actualWeight;
    data['activityLevel'] = activityLevel;
    return data;
  }
}
