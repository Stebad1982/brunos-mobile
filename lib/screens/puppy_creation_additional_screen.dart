import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/enums.dart';
import 'package:brunos_kitchen/view_models/puppy_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../dunmmy_data.dart';
import '../utils/custom_buttons.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../utils/images.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/date_picker_bottom_sheet_widget.dart';

class PuppyCreationAdditionalScreen extends StatelessWidget {
  const PuppyCreationAdditionalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuppyViewModel>(builder: (_, puppyViewModel, __) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
          heading: context.read<PuppyViewModel>().getRouteToPuppyFrom ==
                  Screens.home.text
              ? 'Create Account'
              : 'My Pets',
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible:
                          context.read<PuppyViewModel>().getRouteToPuppyFrom ==
                              Screens.home.text,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Center(
                          child: Image.asset(
                            buyBulits1,
                            height: 57.h,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        dogFace,
                        height: 102.h,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                        child:
                            black24w500Centre(data: 'Additional Information')),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: black14w400Centre(
                          data:
                              'In less than a minute, we’ll create a unique meal plan designed to meet your dog’s needs.'),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    black18w500(
                        data:
                            'Which Breed type is ${puppyViewModel.getPuppyNameController.text.isNotEmpty ? puppyViewModel.getPuppyNameController.text : 'Pet'}?'),
                    SizedBox(
                      height: 8.h,
                    ),
                    black14w400Centre(
                        data: 'Currently serving 300+ breeds and counting.'),
                    SizedBox(
                      height: 19.h,
                    ),
                    TextField(
                      controller: puppyViewModel.getPuppyBreedController,
                      scrollPadding: EdgeInsets.only(bottom: 150),
                      onChanged: (value) {
                        puppyViewModel.searchBreeds(value);
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Enter Your Pet\'s Breed'),
                    ),
                    Visibility(
                      visible: puppyViewModel.getBreedslist.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CustomColors.orangeColor,
                              width: 1.5,
                            ),
                            color: CustomColors.orangeColorTint,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 200.h,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(5),
                              itemCount: puppyViewModel.getBreedslist.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      puppyViewModel
                                              .getPuppyBreedController.text =
                                          puppyViewModel
                                              .getBreedslist[index].name!;
                                      puppyViewModel.setBreedsList([]);
                                    },
                                    title: black12w500Centre(
                                        data: puppyViewModel
                                            .getBreedslist[index].name!),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Visibility(
                        visible:
                            puppyViewModel.getPuppyBreedFieldError.isNotEmpty,
                        child: orange14w400(
                            data: puppyViewModel.getPuppyBreedFieldError)),
                    /* Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: CustomColors.lightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          black14w400Centre(data: 'Aidi'),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),*/
                    /* SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: CustomColors.lightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add),
                            black14w400Centre(data: 'Add Another Breed'),
                          ],
                        ),
                      ),
                    ),*/
                    SizedBox(
                      height: 34.h,
                    ),
                    orange14w400(
                        data:
                            'If ${puppyViewModel.getPuppyNameController.text.isNotEmpty ? puppyViewModel.getPuppyNameController.text : 'Pet'} is a mixed breed'),
                    SizedBox(
                      height: 40.h,
                    ),
                    black18w500(
                        data:
                            'When is ${puppyViewModel.getPuppyNameController.text.isNotEmpty ? puppyViewModel.getPuppyNameController.text : 'Pet'} birthday?'),
                    SizedBox(
                      height: 19.h,
                    ),
                    InkWell(
                      onTap: () {
                        datePickerBottomSheetWidget();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: CustomColors.lightGreyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                              child: black14w400Centre(
                                  data: puppyViewModel.getPuppyDob)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    /* Visibility(
                        visible:
                            puppyViewModel.getPuppyDobFieldError.isNotEmpty,
                        child: orange14w400(
                            data: puppyViewModel.getPuppyDobFieldError)),*/
                    SizedBox(
                      height: 40.h,
                    ),
                    black18w500(
                        data:
                            'How much does ${puppyViewModel.getPuppyNameController.text.isNotEmpty ? puppyViewModel.getPuppyNameController.text : 'Pet'} weight?'),
                    SizedBox(
                      height: 9.h,
                    ),
                    black14w400Centre(
                        data: 'Not Sure? Give us your best guess.'),
                    SizedBox(
                      height: 18.h,
                    ),
                    black14w400Centre(data: 'Current Weight (Optional)'),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextField(
                      controller: puppyViewModel.getPuppyCurrentWeight,
                      /*onChanged: (text) {
                        puppyViewModel.setPuppyCurrentWeight(int.parse(text));
                      },*/
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Weight in KG'),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    /*   Visibility(
                        visible: puppyViewModel
                            .getCurrentWeightFieldError.isNotEmpty,
                        child: orange14w400(
                            data: puppyViewModel.getCurrentWeightFieldError)),*/
                    SizedBox(
                      height: 20.h,
                    ),
                    black14w400Centre(data: 'Ideal Weight (Optional)'),
                    TextField(
                      controller: puppyViewModel.getPuppyActualWeight,
                      /* onChanged: (text) {
                        puppyViewModel.setPuppyActualWeight(int.parse(text));
                      },*/
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Weight in KG'),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    /*Visibility(
                        visible:
                            puppyViewModel.getActualWeightFieldError.isNotEmpty,
                        child: orange14w400(
                            data: puppyViewModel.getActualWeightFieldError)),*/
                    SizedBox(
                      height: 40.h,
                    ),
                    black18w500(data: 'Activity Level ?'),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: customSquareButton(
                              text: 'Active',
                              onPressed: () {
                                puppyViewModel
                                    .setPuppyActivityLevel(Puppy.active.text);
                              },
                              colored: puppyViewModel.getPuppyActivityLevel ==
                                  Puppy.active.text),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: customSquareButton(
                              text: 'Very Active',
                              onPressed: () {
                                puppyViewModel.setPuppyActivityLevel(
                                    Puppy.veryActive.text);
                              },
                              colored: puppyViewModel.getPuppyActivityLevel ==
                                  Puppy.veryActive.text),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: customSquareButton(
                              text: 'Less Active',
                              onPressed: () {
                                puppyViewModel.setPuppyActivityLevel(
                                    Puppy.lessActive.text);
                              },
                              colored: puppyViewModel.getPuppyActivityLevel ==
                                  Puppy.lessActive.text),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      height: 70.h,
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5,
                        spreadRadius: 2,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: customButton(
                        text: 'Save',
                        onPressed: () {
                          if (puppyViewModel
                              .puppyAdditionalCreationValidation()) {
                            puppyViewModel.getIsPuppyEdit
                                ? puppyViewModel
                                    .callEditPuppyApi()
                                    .then((value) => {
                                          if (value)
                                            {
                                              Navigator.of(context)
                                                ..pop()
                                                ..pop(),
                                            }
                                        })
                                : puppyViewModel
                                    .callRegisterPuppyApi()
                                    .then((value) => {
                                          if (value)
                                            {
                                              Navigator.of(context)
                                                ..pop()
                                                ..pop(),
                                              puppyViewModel
                                                          .getRouteToPuppyFrom ==
                                                      Screens.home.text
                                                  ? Navigator.pushNamed(
                                                      context, choosePlanRoute)
                                                  : Navigator.pushNamed(context,
                                                      puppyConfirmationRoute),
                                              context
                                                  .read<AuthViewModel>()
                                                  .callSplash()
                                            }
                                        });
                          }
                        },
                        colored: true),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
