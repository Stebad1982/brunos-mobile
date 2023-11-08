class FeedbackRequest {
  String title;
  String description;

  //List<String>? media;
  String type;

  FeedbackRequest(
      {required this.title,
      required this.description,
      /* this.media,*/ required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    //data['media'] = this.media;
    data['type'] = this.type;
    return data;
  }
}
