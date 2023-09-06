import 'package:brunos_kitchen/models/puppy_model.dart';

import 'dishes_model.dart';

class CartModel {
  PuppyModel puppy;
  List<SelectedDishModel> selectedDish;
  String deliveryDate;
  CartModel({required this.selectedDish,required this.puppy, required this.deliveryDate});
}