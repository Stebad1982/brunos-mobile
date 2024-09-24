class OtpVerifyRequest {
  String email;
  String otp;
  String type;

  OtpVerifyRequest({required this.email, required this.otp, required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['otp'] = otp;
    data['type'] = type;
    return data;
  }
}