import 'package:brunos_kitchen/models/base_response_model.dart';

class BlogsNewsResponse extends BaseResponseModel {
  List<BlogsNewsData>? data;

  BlogsNewsResponse({super.isSuccess, this.data, super.message});

  BlogsNewsResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <BlogsNewsData>[];
      json['data'].forEach((v) {
        data!.add(new BlogsNewsData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class BlogsNewsData {
  String? sId;
  String? title;
  String? description;
  List<String>? media;

  BlogsNewsData({this.sId, this.title, this.description, this.media});

  BlogsNewsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['media'] = this.media;
    return data;
  }
}
