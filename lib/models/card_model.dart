class CardModel {
  String? sId;
  String? cardPM;
  String? userId;

  CardModel({this.sId, this.cardPM, this.userId});

  CardModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cardPM = json['cardPM'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cardPM'] = this.cardPM;
    data['userId'] = this.userId;
    return data;
  }
}
