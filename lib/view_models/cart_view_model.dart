import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/services/promo_api_services.dart';
import 'package:brunos_kitchen/utils/calculations.dart';
import 'package:brunos_kitchen/view_models/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/base_response_model.dart';
import '../models/cart_model.dart';
import '../models/recipe_model.dart';
import '../models/requests/order_request.dart';
import '../models/responses/promo_code_response.dart';
import '../utils/date_time_formatter.dart';
import 'auth_view_model.dart';

class CartViewModel with ChangeNotifier {
  final List<CartModel> _cartList = [];
  final PromoApiServices _promoApiServices = PromoApiServices();
  num _cartTotalPrice = 0;
  num _promoCodeDiscount = 0;
  double _pawPoints = 0;
  int _pawSelectedPoints = 0;
  int _requiredPawPoints = 0;
  num _checkOutTotal = 0;
  int _deliveryFee = 0;
  /*int _deliveryCharges = navigatorKey.currentContext!
       .read<AuthViewModel>()
       .getAuthResponse
       .data!
       .location!.area == ''? 10 :20;*/
  int? _selectedIndex;
  bool _viewCartItemDetail = false;
  final TextEditingController _promoCodeController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 4));
  DateTime _selectedDay = DateTime.now().add(const Duration(days: 4));

  double get getPawPoints => _pawPoints;

  int get getDeliveryFee => _deliveryFee;

   void setDeliveryFee (int value){
  _deliveryFee = value;
  notifyListeners();
  }

  TextEditingController get getInstructionsController =>
      _instructionsController;

  void setPawPoints(double value) {
    _pawPoints = value;
    notifyListeners();
  }

  int get getRequiredPawPoints => _requiredPawPoints;

  void setRequiredPawPoints(num pointsAggregate) {
    _requiredPawPoints = (getCartTotalPrice / pointsAggregate).floor();
    notifyListeners();
  }

  int get getPawSelectedPoints => _pawSelectedPoints;

  void setPawSelectedPoints() {
    _pawSelectedPoints = _pawPoints.round();
    _promoCodeDiscount = 0;
    _promoCodeController.clear();
    setCheckOutTotal();
  }

  num get getPromoCodeDiscount => _promoCodeDiscount;

  TextEditingController get getPromoCodeController => _promoCodeController;

 // int get getDeliveryCharges => _deliveryCharges;
/*
  void setDeliveryCharges (int value){
    navigatorKey.currentContext!
        .read<AuthViewModel>()
        .getAuthResponse
        .data!
        .location!
  }*/

  void setPromoCodeDiscount(int value) {
    _pawSelectedPoints = 0;
    _requiredPawPoints = 0;
    _promoCodeDiscount = value /*_cartTotalPrice * (value / 100)*/;
    setCheckOutTotal();
  }

  num get getCheckOutTotal => _checkOutTotal;

  void setCheckOutTotal() {
    final num finalPoints = _pawSelectedPoints *
        navigatorKey.currentContext!
            .read<AuthViewModel>()
            .getAuthResponse
            .data!
            .discounts![5]
            .aggregate!;
    final totalPrice = _cartTotalPrice - _promoCodeDiscount + _deliveryFee - finalPoints;

    _checkOutTotal = roundPrice(totalPrice.round());

    notifyListeners();
  }

  clearData() {
    _promoCodeController.clear();
    _instructionsController.clear();
    _promoCodeDiscount = 0;
    _pawSelectedPoints = 0;
    _requiredPawPoints = 0;
  }

  bool get getViewCartItemDetail => _viewCartItemDetail;

  void setViewCartItemDetail(bool value) {
    _viewCartItemDetail = value;
    notifyListeners();
  }

  void setOrderRequest() {
    final OrderRequest orderData = OrderRequest(
        totalAmount: _checkOutTotal,
        locationId: navigatorKey.currentContext!
            .read<AuthViewModel>()
            .getAuthResponse
            .data!
            .location!
            .sId!,
        paymentMethod: navigatorKey.currentContext!
            .read<AuthViewModel>()
            .getAuthResponse
            .data!
            .card!
            .paymentMethodId!,
        discountPercentage: 10,
        deliveryDate: DateTimeFormatter.showDateFormat3(_selectedDay),
        promoCodeId: _promoCodeController.text,
        cartItems: _cartList,
        cartTotal: _cartTotalPrice,
        shippingFees: _deliveryFee,
        specialInstructions: _instructionsController.text);
    navigatorKey.currentContext!
        .read<OrderViewModel>()
        .setOrderRequest(orderData);
  }

  void clearCart() {
    _selectedIndex = null;
    _cartTotalPrice = 0;
    _cartList.clear();
  }

  DateTime get getFocusedDay => _focusedDay;

  DateTime? get getSelectedDay => _selectedDay;

  List<CartModel> get getCartList => _cartList;

  num get getCartTotalPrice => _cartTotalPrice;

  int? get getSelectedIndex => _selectedIndex;

  void setSelectedIndex(int? value) {
    _selectedIndex = value;
    if (_selectedIndex != null) {
      if (_cartList[_selectedIndex!].pet != null) {
        navigatorKey.currentContext!
            .read<AuthViewModel>()
            .setPuppy(_cartList[_selectedIndex!].pet!);
      }
    }
    notifyListeners();
  }

  void onDaySelected(DateTime day, DateTime focusDay) {
    if (day.weekday != 7) {
      if (day.weekday != 6) {
        if (!isSameDay(_selectedDay, day)) {
          _selectedDay = day;
          focusDay = focusDay;
          notifyListeners();
        }
      } else {
        EasyLoading.showError('Don\'t select weakeneds');
      }
    } else {
      EasyLoading.showError('Don\'t select weakeneds');
    }
  }

  void clearDates() {
    _focusedDay = DateTime.now().add(const Duration(days: 4));
    _selectedDay = DateTime.now().add(const Duration(days: 4));
  }

  bool checkCartForPlanValidation({required String planType}) {
    // setSelectedIndex(null);
    final int index = _cartList.indexWhere((element) {
      if (element.pet != null) {
        return element.pet!.sId ==
                navigatorKey.currentContext!
                    .read<AuthViewModel>()
                    .getAuthResponse
                    .data!
                    .pet!
                    .sId! &&
            element.planType == planType;
      } else {
        return false;
      }
    });
    return index == -1 ? true : false;
  }

  bool checkProductValidation({required RecipeModel recipe}) {
    // setSelectedIndex(null);
    final int index = _cartList.indexWhere((element) =>
        element.recipes[0].sId == recipe.sId &&
        (element.recipes[0].selectedItemSize != null
            ? element.recipes[0].selectedItemSize!.name ==
                recipe.selectedItemSize!.name
            : element.recipes[0].selectedItemSize ==
                element.recipes[0].selectedItemSize));
    return index == -1 ? true : false;
  }

  void addToCartList(CartModel value) {
    if (_selectedIndex == null) {
      _cartList.add(value);
      print(_cartList);
    } else {
      _cartList[_selectedIndex!] = value;
    }
    _cartTotalPrice = calculateCartTotal(cartItems: _cartList);
    notifyListeners();
  }

  void removeFromCartList(CartModel value) {
    _cartList.remove(value);
    _cartTotalPrice = calculateCartTotal(cartItems: _cartList);
    notifyListeners();
  }

  Future<bool> callPromoCodeApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final PromoCodeResponse response = await _promoApiServices
          .checkPromoCodeApi(code: _promoCodeController.text);
      if (response.isSuccess!) {
        EasyLoading.dismiss();
        setPromoCodeDiscount(response.data!.discount!);
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
