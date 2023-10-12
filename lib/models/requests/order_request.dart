import '../cart_model.dart';

class OrderRequest {
  num totalAmount;
  String locationId;
  String paymentMethod;
  num discountPercentage;
  String deliveryDate;
  String promoCodeId;
  List<CartModel> cartItems;

  OrderRequest(
      {required this.totalAmount,
        required this.locationId,
        required this.paymentMethod,
        required this.discountPercentage,
        required this.deliveryDate,
        required this.promoCodeId,
        required this.cartItems});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalAmount'] = totalAmount;
    data['locationId'] = locationId;
    data['paymentMethod'] = paymentMethod;
    data['discountPercentage'] = discountPercentage;
    data['deliveryDate'] = deliveryDate;
    data['promoCodeId'] = promoCodeId;
    data['orderItems'] = cartItems.map((v) => v.toJson()).toList();
    return data;
  }
}



