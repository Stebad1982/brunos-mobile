import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/order_request.dart';
import 'package:brunos_kitchen/services/order_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/cart_model.dart';

class OrderViewModel with ChangeNotifier {
  OrderApiServices _orderApiServices = OrderApiServices();
  OrderRequest? _orderRequest;

void setOrderRequest(OrderRequest value){
  _orderRequest = value;
}


  Future<bool> callCreateOrderApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final BaseResponseModel response = await _orderApiServices.createOrderApi(orderRequest: _orderRequest!);
      if (response.isSuccess!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

}