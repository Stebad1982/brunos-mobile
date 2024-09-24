import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/custom_colors.dart';





class RecipesCarouselWidget extends StatefulWidget {
  final List<String> recipesImages;
  const RecipesCarouselWidget({super.key, required this.recipesImages});

  @override
  _RecipesCarouselWidgetState createState() => _RecipesCarouselWidgetState();
}

class _RecipesCarouselWidgetState extends State<RecipesCarouselWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: [for ( var image in widget.recipesImages ) Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.greyMediumLightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(image,))],
          carouselController: _controller,
          options: CarouselOptions(
            enableInfiniteScroll: widget.recipesImages.length > 1,
             height: 180.h,
              autoPlay: widget.recipesImages.length > 1,
              viewportFraction: 0.90.w,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      SizedBox(height: 5.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.recipesImages.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 7.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : CustomColors.orangeColor)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
