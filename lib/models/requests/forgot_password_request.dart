class ForgotPasswordRequest {
  String email;
  String otp;
  String password;

  ForgotPasswordRequest({required this.email, required this.otp, required this.password});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['password'] = this.password;
    return data;
  }
}