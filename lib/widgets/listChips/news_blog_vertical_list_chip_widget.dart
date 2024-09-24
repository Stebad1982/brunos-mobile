import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/responses/blogs_news_response.dart';
import '../../utils/date_time_formatter.dart';
import '../../view_models/faqs_blogs_news_view_model.dart';
import '../circular_network_image_widget.dart';
Widget newsBlogsVerticalListChipWidget({ required BlogsNewsData data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20).w,
    child: Column(
      children: [
        InkWell(
          onTap: () {
navigatorKey.currentContext!.read <FaqsBlogsNewsViewModel>().setSelectedBlogNews(data);
              Navigator.pushNamed(
                  navigatorKey.currentContext!, blogsDetailRoute);

          },
          child: Container(
            decoration: ShapeDecoration(
              color: CustomColors.lightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*data.media!.isNotEmpty
                          ?*/ circularNetworkImageWidget(
                          image: data.media![0], size: 40.h)
                        /*  : SizedBox(
                        height: 40.h,
                        width: 40.h,
                        child: CircleAvatar(
                          backgroundColor: CustomColors.yellowColor,
                          child: SvgPicture.asset(dogFace),
                        ),
                      )*/,
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: black14w500(data: data.title!)),
                    //  Spacer(),

                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      grey14w400(data: 'Posted On: ${DateTimeFormatter.timeStampToDate(data.createdOnDate!,2)}'),
                      const Spacer(),
                      orange14w400(data: 'View Detail >>'),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    ),
  );
}

/*
Widget newsBlogsVerticalListChipWidget({required BlogsNewsData data}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 500,
        child: InkWell(
          onTap: () async {
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    black18w500(data: data.title!),
                  ],
                ),
                SizedBox(height: 20.h,),
                SizedBox(
                    height: 200.h,
                    child: RecipesCarouselWidget(recipesImages: data.media!,)),
                Html(data: data.description,)
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Divider(color: CustomColors.lightBlackColor,height: 2.0.h,)
    ],
  );
}
*/
