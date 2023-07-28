import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

class AppBarWithBackWidget extends StatelessWidget implements PreferredSizeWidget{
  final String? heading;
  const AppBarWithBackWidget({Key? key,  this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 60.h,
      backgroundColor: CustomColors.whiteColor,
      elevation: 0,
      title: heading != null? Text(heading!) : Container(),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: CustomColors.blackColor,
        ),
      ),
    /*  actions: [
        Row(
          children: [
            const NotificationIconWidget(),

            SizedBox(
              width: 20.w,
            )
          ],
        )
      ],*/

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.h);
}
