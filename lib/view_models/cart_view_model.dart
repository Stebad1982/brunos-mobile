import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/calculations.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/cart_model.dart';
import '../models/recipe_model.dart';
import 'auth_view_model.dart';

class CartViewModel with ChangeNotifier {
  final List<CartModel> _cartList = [];
  num _cartTotalPrice = 0;
  int? _selectedIndex;
  bool _viewCartItemDetail = false;
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 4));
  DateTime _selectedDay = DateTime.now().add(const Duration(days: 4));


  bool get getViewCartItemDetail => _viewCartItemDetail;

  void setViewCartItemDetail(bool value) {
    _viewCartItemDetail = value;
    notifyListeners();
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
    if (!isSameDay(_selectedDay, day)) {
      _selectedDay = day;
      focusDay = focusDay;
      notifyListeners();
    }
  }

  void clearDates(){
    _focusedDay = DateTime.now().add(const Duration(days: 4));
    _selectedDay = DateTime.now().add(const Duration(days: 4));
  }
  bool checkCartForPlanValidation({required String planType}) {
    setSelectedIndex(null);
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
    setSelectedIndex(null);
    final int index = _cartList.indexWhere((element) =>
    element.recipes[0].sId == recipe.sId &&
        (element.recipes[0].selectedItemSize != null ? element.recipes[0]
            .selectedItemSize!.name == recipe.selectedItemSize!.name : element.recipes[0].selectedItemSize == element.recipes[0].selectedItemSize));
    return index == -1 ? true : false;
  }

  void addToCartList(CartModel value) {
    if (_selectedIndex == null) {
      _cartList.add(value);
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
}
