

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/logo.png'),
      logoWidth: 150.78.w,
      /* title:  Text(
        'Customer',
        style: TextStyle(
          color: CustomColors.color1,
          fontWeight: FontWeight.w500,
          fontSize: 40.sp,
          fontFamily: 'Rubik',
        ),
      ),*/
      backgroundImage: Image.asset('assets/images/splash-bg.png').image,
      //backgroundColor: CustomColors.color4,
      showLoader: false,
      //loadingText: const Text("Loading...",style: TextStyle(color: CustomColors.color1),),
      futureNavigator:
          context.read<AuthViewModel>().callVersionAndBuildNumber(),
      // navigator: const IntroSlidesScreen(),
      durationInSeconds: 1,
      loaderColor: CustomColors.orangeColor,
    );
  }
}
