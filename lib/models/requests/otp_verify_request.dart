class OtpVerifyRequest {
  String email;
  String otp;
  String type;

  OtpVerifyRequest({required this.email, required this.otp, required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['type'] = this.type;
    return data;
  }
}