import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/recipe_model.dart';
import '../route_generator.dart';
import '../utils/calculations.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/enums.dart';
import '../view_models/cart_view_model.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/carousels/product_carousel_widget.dart';
import '../widgets/dialogs/discription_dialog.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
            heading: toBeginningOfSentenceCase(
                '${plansViewModel.getSelectedRecipe.name}'),
            showPuppy: false,
            showCart: context.read<CartViewModel>().getSelectedIndex == null),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 300.h,
                        child: ProductCarouselWidget(
                          productImages:
                              plansViewModel.getSelectedRecipe.media!,
                        )),
/*
                    Container(
                        width: double.infinity,
                        height: 300.h,
                        decoration: ShapeDecoration(
                          color: CustomColors.lightGreyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Center(
                            child: Image.network(
                              plansViewModel.getSelectedRecipe.media![0],
                              //height: 200.h,
                            ),
                          ),
                        )),
*/
                    SizedBox(
                      height: 24.h,
                    ),
                    Visibility(
                      visible: plansViewModel.getSelectedRecipe.details!.isNotEmpty || plansViewModel.getSelectedRecipe.weight!.isNotEmpty,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: plansViewModel.getSelectedRecipe.details!.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  black14w500(data: 'Brand'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  black24w500Centre(
                                      data:
                                          plansViewModel.getSelectedRecipe.details!)
                                ],
                              ),
                            ),
                            Visibility(
                              visible: plansViewModel.getSelectedRecipe.weight!.isNotEmpty,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  black14w500(
                                      data:  'Weight'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  black24w500Centre(
                                      data:
                                          '${plansViewModel.getSelectedRecipe.weight} Kg')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              black14w500(
                                  data: plansViewModel
                                              .getSelectedRecipe.category ==
                                          ProductCategories.standardRecipes.text
                                      ? 'Pouch Price'
                                      : 'Unit Price'),
                              SizedBox(
                                height: 15.h,
                              ),
                              black24w500Centre(
                                  data:
                                      'AED ${plansViewModel.getSelectedRecipe.pricePerKG}')
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              black14w500(data: 'Quantity'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Visibility(
                                    visible: context
                                            .read<CartViewModel>()
                                            .getViewCartItemDetail ==
                                        false,
                                    child: InkWell(
                                      onTap: () {
                                        plansViewModel.minusQuantity();
                                      },
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: CustomColors.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 0.75,
                                                color: CustomColors
                                                    .greyMediumColor),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: CustomColors.greyColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 40.w,
                                      child: Center(
                                          child: black18w500(
                                              data: plansViewModel.getQuantity
                                                  .toString()))),
                                  Visibility(
                                    visible: context
                                            .read<CartViewModel>()
                                            .getViewCartItemDetail ==
                                        false,
                                    child: InkWell(
                                      onTap: () {
                                        plansViewModel.addQuantity();
                                      },
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: CustomColors.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 0.75,
                                                color: CustomColors
                                                    .greyMediumColor),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: CustomColors.greyColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Visibility(
                        visible: plansViewModel.getSelectedRecipe.category ==
                            ProductCategories.standardRecipes.text,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: orange14w500(
                              data: 'Single Pouch Consists of ${plansViewModel.getSelectedRecipe.standaloneSize} grams'),
                        )),
                    plansViewModel.getSelectedRecipe.selectedItemSize != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                context
                                        .read<CartViewModel>()
                                        .getViewCartItemDetail
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          black14w500(data: 'Size'),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          black18w500(
                                              data: plansViewModel
                                                  .getSelectedRecipe
                                                  .selectedItemSize!
                                                  .name!)
                                        ],
                                      )
                                    : Visibility(
                                        visible: context
                                                .read<CartViewModel>()
                                                .getViewCartItemDetail ==
                                            false,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child:
                                              black14w500(data: 'Select Sizes'),
                                        )),
                                Visibility(
                                  visible: context
                                          .read<CartViewModel>()
                                          .getViewCartItemDetail ==
                                      false,
                                  child: Wrap(
                                    runSpacing: 10,
                                    spacing: 10,
                                    children: [
                                      for (var sizes in plansViewModel
                                          .getSelectedRecipe.sizes!)
                                        SizedBox(
                                          width: 100.w,
                                          child: customSquareButton(
                                              text: '${sizes.name}',
                                              onPressed: () {
                                                plansViewModel
                                                    .setSelectedItemSize(sizes);
                                              },
                                              colored: plansViewModel
                                                          .getSelectedRecipe
                                                          .selectedItemSize ==
                                                      sizes
                                                  ? true
                                                  : false),
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 24.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: black14w500(data: 'Details'),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      // child: black14w500(data: plansViewModel.getSelectedRecipe.),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: grey14w400(
                          lineHeight: true,
                          data: plansViewModel.getSelectedRecipe.description!),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: context.read<CartViewModel>().getViewCartItemDetail ==
                    false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        if (context.read<CartViewModel>().getSelectedIndex ==
                            null) {
                          if (context
                              .read<CartViewModel>()
                              .checkProductValidation(
                                  recipe: plansViewModel.getSelectedRecipe)) {
                            final List<RecipeModel> recipeList = [];
                            plansViewModel.setProductModel();
                            recipeList.add(plansViewModel.getSelectedRecipe);
                            final planTotalPrice =
                                calculatePlanTotal(listOfItems: recipeList);
                            context.read<CartViewModel>().addToCartList(
                                  CartModel(
                                      recipes: recipeList,
                                      pet: null,
/*
                                  deliveryDate: '03 Oct 2023',
*/
                                      planType: plansViewModel.getPlanType,
                                      planTotal: planTotalPrice,
                                      pouchesDetail: [],
                                      totalWeight: [],
                                      planDiscountedPrice: planTotalPrice,
                                      planDiscountPer: 0),
                                );

                            Navigator.pushNamedAndRemoveUntil(context,
                                bottomNavigationRoute, (route) => false);

                            EasyLoading.showToast(
                                '${plansViewModel.getPlanType} Successfully Added To\nShopping Bag',
                                toastPosition: EasyLoadingToastPosition.center);
                          } else {
                            Navigator.pushNamed(context, cartRoute);
                            descriptionDialog(
                                context: context,
                                description:
                                    '${plansViewModel.getSelectedRecipe.name} is already added to shopping bag',
                                height: 180.h,
                                title: 'Alert');
                          }
                        } else {
                          final List<RecipeModel> recipeList = [];
                          plansViewModel.setProductModel();
                          recipeList.add(plansViewModel.getSelectedRecipe);
                          final planTotalPrice =
                              calculatePlanTotal(listOfItems: recipeList);
                          context.read<CartViewModel>().addToCartList(
                                CartModel(
                                    recipes: recipeList,
                                    pet: null,
/*
                                deliveryDate: '03 Oct 2023',
*/
                                    planType: plansViewModel.getPlanType,
                                    planTotal: planTotalPrice,
                                    pouchesDetail: [],
                                    totalWeight: [],
                                    planDiscountedPrice: planTotalPrice,
                                    planDiscountPer: 0),
                              );
                          Navigator.pushNamedAndRemoveUntil(context, cartRoute,
                              (Route route) => route.isFirst);
                        }
                      },
                      child: Container(
                          height: 90.h,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: CustomColors.orangeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    white18w500(
                                        data:
                                            'AED ${plansViewModel.getSelectedRecipe.pricePerKG! * plansViewModel.getQuantity}'),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    whiteTint14w400(data: 'Total Price')
                                  ],
                                ),
                                Spacer(),
                                white18w500(data: 'Add to shopping bag')
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
