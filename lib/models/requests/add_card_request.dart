class AddCardRequest {
  String cardPM;

  AddCardRequest({required this.cardPM});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardPM'] = this.cardPM;
    return data;
  }
}