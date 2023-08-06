import 'package:brunos_kitchen/models/base_response_model.dart';

class AuthResponse extends BaseResponseModel{
  AuthData? data;

  AuthResponse({super.isSuccess, this.data, super.message});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? AuthData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class AuthData {
  String? fullName;
  String? email;
  String? phoneNumber;
  bool? isVerified;
  bool? isEnableNotification;
  bool? isSocialLogin;
  String? clientToken;
  String? address;

  AuthData(
      {this.fullName,
        this.email,
        this.phoneNumber,
        this.isVerified,
        this.isEnableNotification,
        this.isSocialLogin,
        this.clientToken,
        this.address});

  AuthData.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isVerified = json['isVerified'];
    isEnableNotification = json['isEnableNotification'];
    isSocialLogin = json['isSocialLogin'];
    clientToken = json['clientToken'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['isVerified'] = this.isVerified;
    data['isEnableNotification'] = this.isEnableNotification;
    data['isSocialLogin'] = this.isSocialLogin;
    data['clientToken'] = this.clientToken;
    data['address'] = this.address;
    return data;
  }
}


