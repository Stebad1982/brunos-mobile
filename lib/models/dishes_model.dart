import 'package:brunos_kitchen/utils/images.dart';

class SelectedDishModel {
  DishesModel dishesModel;
  int totalDays;
  int qty;

  SelectedDishModel({required this.dishesModel, required this.totalDays, required this.qty});
}

class DishesModel {
  int? id;
  String? image;
  String? name;

  DishesModel(this.name, this.image, this.id);
}

List<DishesModel> dishList = [
  DishesModel('Beefy Barkfest', food,1),
  DishesModel('Beefy Barkfest', food,2),
  DishesModel('Beefy Barkfest', food,3),
  DishesModel('Beefy Barkfest', food,4),
  DishesModel('Beefy Barkfest', food,5),
  DishesModel('Beefy Barkfest', food,6),
  DishesModel('Beefy Barkfest', food,7),
  DishesModel('Beefy Barkfest', food,8)
];




