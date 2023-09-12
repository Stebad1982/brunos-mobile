import 'package:flutter/cupertino.dart';

import '../models/cart_model.dart';

class CartViewModel with ChangeNotifier {

  final List<CartModel> _cartList = [];

  List<CartModel> get getCartList => _cartList;

  void addToCartList (CartModel value){
    _cartList.add(value);
    notifyListeners();
  }

  void removeFromCartList (CartModel value){
    _cartList.remove(value);
    notifyListeners();
  }

}