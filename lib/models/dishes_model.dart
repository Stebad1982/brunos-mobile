import 'package:brunos_kitchen/utils/images.dart';

class SelectedDishModel {
  DishesModel dishesModel;
  int totalDays;

  SelectedDishModel({required this.dishesModel, required this.totalDays});
}

class DishesModel {
  String? image;
  String? name;

  DishesModel(this.name, this.image);
}

List<DishesModel> dishList = [
  DishesModel('Freshly cooked', food),
  DishesModel('Well balanced nutrient blend', food),
  DishesModel('Doorstep delivery', food),
  DishesModel('Long shelf life', food),
  DishesModel('Human grade ingredients', food),
  DishesModel('AAFCO compliant', food),
  DishesModel('Customized meals', food),
  DishesModel('Vet Developed', food)
];




