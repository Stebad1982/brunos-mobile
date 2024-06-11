import 'dart:math';

import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/cart_model.dart';
import 'package:brunos_kitchen/models/puppy_model.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'enums.dart';

int calculateDailyIntake(
    {required RecipeModel recipeModel,
    required String puppyActivityLevel,
    required num currentWeight,
    required int puppyActualWeight}) {
  int activityLevel = 0 ;
  num dailyIntake;
  if(recipeModel.lifeStage == FeaturedRecipeType.puppy.text){
  activityLevel = puppyActivityLevel == Puppy.active.text
        ? 175
        : puppyActivityLevel == Puppy.lessActive.text
        ? 140
        : 210;
  }
  else{
   activityLevel = puppyActivityLevel == Puppy.active.text
        ? 110
        : puppyActivityLevel == Puppy.lessActive.text
        ? 95
        : 125;
  }


  final num finalGram = (activityLevel *
          pow(currentWeight, 0.75) /
          recipeModel.caloriesContentNo!) *
      1000;
  final weightPercent = finalGram * 5 / 100;

  if (puppyActualWeight == PuppyWeight.underweight.value) {
    dailyIntake = finalGram + weightPercent;
  } else if (puppyActualWeight == PuppyWeight.overweight.value) {
    dailyIntake = finalGram - weightPercent;
  } else {
    dailyIntake = finalGram;
  }

  final int roundDailyIntake = dailyIntake.floor();

  return roundDailyIntake;
}

num calculateFeedingPlan(
    {required RecipeModel recipeModel,
    required PuppyModel puppyModel,
    num? gramsForTransitional}) {
  final int dailyIntake = calculateDailyIntake(
      recipeModel: recipeModel,
      puppyActualWeight: puppyModel.actualWeight!,
      puppyActivityLevel: puppyModel.activityLevel!,
      currentWeight: puppyModel.currentWeight!);
  final double perTime =
      (gramsForTransitional ?? dailyIntake) / puppyModel.feedingRoutine!;
  return perTime;
}

int calculateFinalPricePerDay({required RecipeModel recipeModel}) {
  final PuppyModel puppy = navigatorKey.currentContext!
      .read<AuthViewModel>()
      .getAuthResponse
      .data!
      .pet!;
  final int dailyInTake = calculateDailyIntake(
      recipeModel: recipeModel,
      puppyActivityLevel: puppy.activityLevel!,
      currentWeight: puppy.currentWeight!,
      puppyActualWeight: puppy.actualWeight!);
  final int priceFromWeight = getPriceFromWeight(
      recipeModel: recipeModel, dailyGram: dailyInTake);
  final num pricePerDay = dailyInTake * priceFromWeight / 1000;
  return pricePerDay.round();
}

int getPriceFromWeight(
    {required RecipeModel recipeModel, required num dailyGram}) {
  if(dailyGram >= 1 && dailyGram <= 200){
    return recipeModel.price1!;
  }
  else if(dailyGram >= 201 && dailyGram <= 400){
    return recipeModel.price2!;
  }
  else if(dailyGram >= 401 && dailyGram <= 600){
    return recipeModel.price3!;
  }
  else if(dailyGram >= 601 && dailyGram <= 800){
    return recipeModel.price4!;
  }
  else if(dailyGram >= 801 && dailyGram <= 1000){
    return recipeModel.price5!;
  }
  else {
    return recipeModel.price6!;
  }
}

num calculateTransitionalGram(
    {required RecipeModel recipeModel,
    required int percentage,
    required int days,
    required bool calculatePrice}) {
  final PuppyModel puppy = navigatorKey.currentContext!
      .read<AuthViewModel>()
      .getAuthResponse
      .data!
      .pet!;
  final int dailyInTake = calculateDailyIntake(
      recipeModel: recipeModel,
      puppyActivityLevel: puppy.activityLevel!,
      currentWeight: puppy.currentWeight!,
      puppyActualWeight: puppy.actualWeight!);
  final num gramWithPercent = ((percentage / 100) * dailyInTake) * days;

  return gramWithPercent;
}

num calculateTransitionalPrice(
    {required num gramWithPercent, required RecipeModel recipeModel}) {
  final int priceFromWeight = getPriceFromWeight(
      recipeModel: recipeModel, dailyGram: gramWithPercent);
  final num priceWithPercent = gramWithPercent * priceFromWeight / 1000;
  return priceWithPercent.round();
}

num calculatePlanTotal({required List<RecipeModel> listOfItems}) {
  final num finalPriceSum = listOfItems.fold(0, (i, element) {
    return i + element.finalPrice!;
  });
  return finalPriceSum;
}

num calculatePlanDiscount({required planTotal, required num discountedPer}) {
  final num planDiscountedPer = planTotal * discountedPer / 100;
  final num planDiscountedPrice = planTotal - planDiscountedPer;
  return planDiscountedPrice.round();
}

num calculateCartTotal({required List<CartModel> cartItems}) {
  final num finalPriceSum = cartItems.fold(0, (i, element) {
    num planPrice = 0;
    /* if(element.planType == Plans.monthly.text){*/
    planPrice = i + element.planDiscountedPrice;
    /*}
    else{
      i + element.planTotal;
    }*/
    return planPrice;
  });
  return finalPriceSum;
}

int roundTo10({required int value})
{
  int rem = value % 10;
  return rem >= 5 ? (value - rem + 10) : (value - rem);
}
