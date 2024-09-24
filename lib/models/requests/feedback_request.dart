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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    //data['media'] = this.media;
    data['type'] = type;
    return data;
  }
}
