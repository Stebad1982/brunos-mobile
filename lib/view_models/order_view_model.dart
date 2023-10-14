import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/order_request.dart';
import 'package:brunos_kitchen/models/responses/order_response.dart';
import 'package:brunos_kitchen/services/order_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OrderViewModel with ChangeNotifier {
  final OrderApiServices _orderApiServices = OrderApiServices();
  OrderRequest? _orderRequest;
  OrderResponse _orderResponse = OrderResponse();
  OrderData _selectedOrder = OrderData();

  void setOrderRequest(OrderRequest value) {
    _orderRequest = value;
  }
  OrderData get getSelectedOrder => _selectedOrder;

  void setSelectedOrder(OrderData value){
    _selectedOrder = value;
    notifyListeners();
  }
  OrderResponse get getOrderResponse => _orderResponse;

  void setOrderResponse(OrderResponse value){
    _orderResponse = value;
    notifyListeners();
  }

  Future<bool> callCreateOrderApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final BaseResponseModel response =
          await _orderApiServices.createOrderApi(orderRequest: _orderRequest!);
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

  Future<bool> callOrderListApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final OrderResponse response = await _orderApiServices.allOrderApi();
      if (response.isSuccess!) {
        EasyLoading.dismiss();
        setOrderResponse(response);
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
