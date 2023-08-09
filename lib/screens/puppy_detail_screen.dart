import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:brunos_kitchen/utils/date_time_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../utils/custom_colors.dart';
import '../view_models/puppy_view_model.dart';
import '../widgets/app_bar_with_back_widget.dart';
import '../widgets/circular_network_image_widget.dart';

class PuppyDetailScreen extends StatelessWidget {
  const PuppyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuppyViewModel>(builder: (_, puppyViewModel, __) {
      return Scaffold(
        appBar: AppBarWithBackWidget(
          heading: toBeginningOfSentenceCase(
              '${puppyViewModel.getPuppyDetail!.name} Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: ShapeDecoration(
                      //color: CustomColors.orangeColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.75, color: CustomColors.orangeColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: CustomColors.orangeColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              circularNetworkImageWidget(
                  image: puppyViewModel.getPuppyDetail!.media!, size: 130.h),
              SizedBox(
                height: 10.h,
              ),
              black24w500Centre(data: puppyViewModel.getPuppyDetail!.name!),
              SizedBox(
                height: 5.h,
              ),
              grey14w400(data: '( ${puppyViewModel.getPuppyDetail!.breed!} )'),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black16w500(data: 'Set As Primary'),
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      activeColor: CustomColors.orangeColor,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black14w500(data: 'Gender'),
                  black14w500(data: toBeginningOfSentenceCase('Boy')!)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black14w500(data: 'Spayed/Neutered?'),
                  black14w500(data: toBeginningOfSentenceCase(puppyViewModel.getPuppyDetail!.isSpayNeuter!? 'Yes' : 'No')!)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black14w500(data: 'BirthDay'),
                  black14w500(data: DateTimeFormatter.timeStampToDate(puppyViewModel.getPuppyDetail!.bornOnDate!))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black14w500(data: 'Current Weight'),
                  black14w500(data: puppyViewModel.getPuppyDetail!.currentWeight!.toString())
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black14w500(data: 'Actual Weight'),
                  black14w500(data: puppyViewModel.getPuppyDetail!.actualWeight!.toString())
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  black14w500(data: 'Activity Level'),
                  black14w500(data: toBeginningOfSentenceCase(puppyViewModel.getPuppyDetail!.activityLevel!)!)
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
