import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/calculations.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import 'auth_view_model.dart';

class CartViewModel with ChangeNotifier {
  final List<CartModel> _cartList = [];
  num _cartTotalPrice = 0;
  int? _selectedIndex;

  List<CartModel> get getCartList => _cartList;

  num get getCartTotalPrice => _cartTotalPrice;

  int? get getSelectedIndex => _selectedIndex;

  void setSelectedIndex(int? value) {
    _selectedIndex = value;
    if (_selectedIndex != null) {
      navigatorKey.currentContext!
          .read<AuthViewModel>()
          .setPuppy(_cartList[_selectedIndex!].puppy!);
    }
    notifyListeners();
  }

  void replaceSelectedIndex(CartModel value) {
    _cartList[_selectedIndex!] = value;
    notifyListeners();
  }

  bool checkCartForPlanValidation({required String planType}) {
    navigatorKey.currentContext!.read<CartViewModel>().setSelectedIndex(null);
    final int index = _cartList.indexWhere((element) {
      if (element.puppy != null) {
        return element.puppy!.sId ==
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

  void addToCartList(CartModel value) {
    _cartList.add(value);
    _cartTotalPrice = calculateCartTotal(cartItems: _cartList);
    notifyListeners();
  }

  void removeFromCartList(CartModel value) {
    _cartList.remove(value);
    _cartTotalPrice = calculateCartTotal(cartItems: _cartList);
    notifyListeners();
  }
}
