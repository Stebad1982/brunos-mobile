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
        data!.add(BannerData.fromJson(v));
      });
    }
    isServerError = json['isServerError'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isServerError'] = isServerError;
    data['message'] = message;
    return data;
  }
}

class BannerData {
  String? sId;
  String? title;
  String? description;
  bool? isFeatured;
  String? type;
  List<String>? media;

  BannerData({this.sId, this.title, this.description, this.type, this.media});

  BannerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    isFeatured = json['isFeatured'];
    description = json['description'];
    type = json['type'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['isFeatured'] = isFeatured;
    data['description'] = description;
    data['type'] = type;
    data['media'] = media;
    return data;
  }
}