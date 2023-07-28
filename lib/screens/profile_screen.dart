import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../widgets/app_bar_with_back_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: CustomColors.lightGreyColor,
      body: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
        child: Column(children: [
          Row(children: [

          ],)
        ],),
      ),
    );
  }
}
