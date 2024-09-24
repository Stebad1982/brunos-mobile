import 'package:brunos_kitchen/models/base_response_model.dart';

class BlogsNewsResponse extends BaseResponseModel {
  List<BlogsNewsData>? data;

  BlogsNewsResponse({super.isSuccess, this.data, super.message});

  BlogsNewsResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <BlogsNewsData>[];
      json['data'].forEach((v) {
        data!.add(BlogsNewsData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class BlogsNewsData {
  String? sId;
  String? title;
  String? description;
  int? createdOnDate;
  List<String>? media;

  BlogsNewsData({this.sId, this.title, this.description, this.media, this.createdOnDate});

  BlogsNewsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdOnDate = json['createdOnDate'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['createdOnDate'] = createdOnDate;
    data['media'] = media;
    return data;
  }
}
