import 'package:brunos_kitchen/widgets/cart_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_buttons.dart';
import '../utils/custom_font_style.dart';
import '../view_models/plans_view_model.dart';
import '../widgets/gridChip/item_discribed_grid_chip_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlansViewModel>(builder: (context, plansViewModel, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black24w500Centre(data: 'Shop'),
                  cartIconWidget()
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              black18w500(data: 'Select Category'),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: plansViewModel.getRecipesListResponse.data!.categories!
                      .map(
                        (data) => Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 140.w,
                      child: customSquareButton(
                          text: data.name!,
                          onPressed: () {
                            plansViewModel.setProductCategory(data
                                .name!);
                          },
                          colored: plansViewModel.getProductCategory ==
                              data.name),
                    ),
                  )
                      .toList(),
                ),
              ),
           /*   Wrap(
                alignment: WrapAlignment.start,
                spacing: 10.w,
                runSpacing: 10.w,
                children: List.generate(
                    plansViewModel.getRecipesListResponse.data!.categories!
                        .length, (index) {
                  return customSquareButton(
                      text: plansViewModel.getRecipesListResponse.data!
                          .categories![index].name!,
                      onPressed: () {
                        plansViewModel.setProductCategory(plansViewModel
                            .getRecipesListResponse
                            .data!
                            .categories![index]
                            .name!);
                      },
                      colored: plansViewModel.getProductCategory ==
                          plansViewModel.getRecipesListResponse.data!
                              .categories![index].name);
                }),
              ),*/
              SizedBox(
                height: 20.h,
              ),
              black18w500(data: 'Products'),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        runSpacing: 20.w,
                        spacing: 20.w,
                        alignment: plansViewModel.getProductList.length == 1
                            ? WrapAlignment.start
                            : WrapAlignment.center,
                        children: List.generate(plansViewModel.getProductList.length,
                            (index) {
                          return SizedBox(
                            width: 157.w,
                            child: itemDescribedGridChipWidget(
                                recipeData: plansViewModel.getProductList[index], showInformationIcon: false),
                          );
                        }),
                      ),
                      SizedBox(height: 80.h,)
                    ],
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
