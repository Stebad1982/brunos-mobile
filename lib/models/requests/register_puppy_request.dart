class RegisterPuppyRequest {
  String name;
  String media;
  String gender;
  bool isSpayNeuter;
  String breed;
  int bornOnDate;
  int currentWeight;
  int actualWeight;
  String activityLevel;

  RegisterPuppyRequest(
      {required this.name,
        required this.media,
        required this.gender,
        required this.isSpayNeuter,
        required this.breed,
        required this.bornOnDate,
        required this.currentWeight,
        required this.actualWeight,
        required this.activityLevel});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['media'] = this.media;
    data['gender'] = this.gender;
    data['isSpayNeuter'] = this.isSpayNeuter;
    data['breed'] = this.breed;
    data['bornOnDate'] = this.bornOnDate;
    data['currentWeight'] = this.currentWeight;
    data['actualWeight'] = this.actualWeight;
    data['activityLevel'] = this.activityLevel;
    return data;
  }
}