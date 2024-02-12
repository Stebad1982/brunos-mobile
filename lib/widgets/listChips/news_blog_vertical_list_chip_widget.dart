import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/recipe_model.dart';
import '../../models/responses/blogs_news_response.dart';
import '../../models/responses/faqs_blogs_news_response.dart';
import '../carousels/recipes_carousel_widget.dart';

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
                black18w500(data: data.title!),
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
