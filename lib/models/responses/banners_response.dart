class BannersResponse {
  bool? isSuccess;
  List<BannerData>? data;
  bool? isServerError;
  String? message;

  BannersResponse(
      {this.isSuccess, this.data, this.isServerError, this.message});

  BannersResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(new BannerData.fromJson(v));
      });
    }
    isServerError = json['isServerError'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isServerError'] = this.isServerError;
    data['message'] = this.message;
    return data;
  }
}

class BannerData {
  String? sId;
  String? title;
  String? description;
  String? type;
  List<String>? media;

  BannerData({this.sId, this.title, this.description, this.type, this.media});

  BannerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['media'] = this.media;
    return data;
  }
}