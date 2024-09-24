class ForgotPasswordRequest {
  String phoneNumber;
  //String otp;
  String password;

  ForgotPasswordRequest({required this.phoneNumber,/* required this.otp,*/ required this.password});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
   // data['otp'] = this.otp;
    data['password'] = password;
    return data;
  }
}