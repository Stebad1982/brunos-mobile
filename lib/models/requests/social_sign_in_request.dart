class SocialSignInRequest {
  String clientId;
  String email;
  String fullName;
  String phoneNumber;
  String deviceType;
  String deviceToken;
  String media;
  String platform;

  SocialSignInRequest(
      {required this.clientId,
        required this.email,
        required this.fullName,
        required this.phoneNumber,
        required this.deviceType,
        required this.deviceToken,
        required this.media,
        required this.platform});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['email'] = email;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['deviceType'] = deviceType;
    data['deviceToken'] = deviceToken;
    data['media'] = media;
    data['platform'] = platform;
    return data;
  }
}