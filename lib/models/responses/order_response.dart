import 'package:brunos_kitchen/models/base_response_model.dart';

import '../order_model.dart';
import '../puppy_model.dart';
import '../recipe_model.dart';

class OrderResponse extends BaseResponseModel {
  List<OrderData>? data;

  OrderResponse({super.isSuccess, this.data, super.message});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(new OrderData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}



