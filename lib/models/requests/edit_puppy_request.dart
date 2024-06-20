class EditPuppyRequest {
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

  EditPuppyRequest(
      {required this.name,
      required this.media,
      required this.gender,
      required this.feedingRoutine,
      //  required this.isSpayNeuter,
      required this.breed,
      //required this.bornOnDate,
      required this.currentWeight,
      required this.actualWeight,
      required this.activityLevel,
      required this.isPuppy,
      required this.month,
      required this.year});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['media'] = this.media;
    data['gender'] = this.gender;
    data['feedingRoutine'] = this.feedingRoutine;
    data['isSpayNeuter'] = false;
    data['breed'] = this.breed;
    data['isPuppy'] = this.isPuppy;
    data['month'] = month;
    data['year'] = year;
    // data['bornOnDate'] = this.bornOnDate;
    data['currentWeight'] = this.currentWeight;
    data['actualWeight'] = this.actualWeight;
    data['activityLevel'] = this.activityLevel;
    return data;
  }
}
