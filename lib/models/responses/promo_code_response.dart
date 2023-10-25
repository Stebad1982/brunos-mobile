import 'package:brunos_kitchen/models/base_response_model.dart';

class PromoCodeResponse extends BaseResponseModel{
  PromoData? data;

  PromoCodeResponse(
      {super.isSuccess, this.data, super.message});

  PromoCodeResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new PromoData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class PromoData {
  String? name;
  int? expireOnDate;
  int? discount;

  PromoData({this.name, this.expireOnDate, this.discount});

  PromoData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    expireOnDate = json['expireOnDate'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['expireOnDate'] = this.expireOnDate;
    data['discount'] = this.discount;
    return data;
  }
}
