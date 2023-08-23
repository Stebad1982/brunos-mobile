import 'package:brunos_kitchen/utils/custom_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/images.dart';

Widget ordersVerticalListChipWidget() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(sampleFood1,height: 45.h,),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lightBlack14w400Centre(data: 'Redbarn Grain Free food'),
              grey14w400(data: '2 Kilograms'),
              SizedBox(
                height: 14.h,
              ),
              black16w500(data: 'AED 50')
            ],
          )
        ],
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
