import 'package:brunos_kitchen/utils/calculations.dart';
import 'package:flutter/cupertino.dart';

import '../models/cart_model.dart';

class CartViewModel with ChangeNotifier {

  final List<CartModel> _cartList = [];
  num _cartTotalPrice = 0;

  List<CartModel> get getCartList => _cartList;

  num get getCartTotalPrice => _cartTotalPrice;

  void addToCartList (CartModel value){
    _cartList.add(value);
    _cartTotalPrice = calculateCartTotal(cartItems: _cartList);
    notifyListeners();
  }

  void removeFromCartList (CartModel value){
    _cartList.remove(value);
    _cartTotalPrice = calculateCartTotal(cartItems: _cartList);
    notifyListeners();
  }

}