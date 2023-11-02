class AddCardRequest {
  String cardPM;
  String cardHolder;

  AddCardRequest({required this.cardPM, required this.cardHolder});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardPM'] = this.cardPM;
    data['cardHolder'] = this.cardHolder;
    return data;
  }
}