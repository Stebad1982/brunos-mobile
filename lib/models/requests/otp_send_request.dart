class OtpSendRequest {
  String email;
  String type;

  OtpSendRequest({required this.email, required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['type'] = type;
    return data;
  }
}