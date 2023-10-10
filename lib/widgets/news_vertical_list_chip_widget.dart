import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/recipe_model.dart';
import '../models/responses/blogs_news_response.dart';
import '../models/responses/faqs_blogs_news_response.dart';
import 'carousels/recipes_carousel_widget.dart';

Widget newsVerticalListChipWidget({required BlogsNewsData data}) {
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
    ],
  );
}
