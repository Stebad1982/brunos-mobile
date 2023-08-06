class SocialSignInRequest {
  String? clientId;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? deviceType;
  String? deviceToken;
  String? media;
  String? platform;

  SocialSignInRequest(
      {this.clientId,
        this.email,
        this.fullName,
        this.phoneNumber,
        this.deviceType,
        this.deviceToken,
        this.media,
        this.platform});

  SocialSignInRequest.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    deviceType = json['deviceType'];
    deviceToken = json['deviceToken'];
    media = json['media'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['deviceType'] = this.deviceType;
    data['deviceToken'] = this.deviceToken;
    data['media'] = this.media;
    data['platform'] = this.platform;
    return data;
  }
}