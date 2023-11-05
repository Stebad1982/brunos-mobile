class AddCardRequest {
  String paymentMethodId;
  AddCardRequest({required this.paymentMethodId});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentMethodId'] = paymentMethodId;
    return data;
  }
}