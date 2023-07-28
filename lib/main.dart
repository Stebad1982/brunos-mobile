import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:brunos_kitchen/view_models/bottom_navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = CustomColors.orangeColor
    ..backgroundColor = CustomColors.orangeColor
    ..indicatorColor = CustomColors.orangeColor
    ..textColor = CustomColors.orangeColor
    ..maskColor = Colors.black.withOpacity(0.5)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver =
RouteObserver<ModalRoute>();
final double screenHeight = MediaQuery
    .of(navigatorKey.currentContext!)
    .size
    .height * 0.9;
Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.amber, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness: Brightness.dark, // color of navigation controls
  ));
  configLoading();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => BottomNavigationViewModel(),
      ),
    ],
        child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375,812),
        //useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
          /*  localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,*/
            theme: ThemeData(
              scaffoldBackgroundColor: CustomColors.whiteColor,
              primaryColor: CustomColors.whiteColor,
              colorScheme: ThemeData().colorScheme.copyWith(
                secondary: CustomColors.whiteColor,
                primary: CustomColors.orangeColor,
              ),
              appBarTheme: AppBarTheme(
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.blackColor,
              )),
              textTheme: TextTheme(
                subtitle1: TextStyle(
                  fontFamily: 'CircularStd',
                  fontSize: 14.sp,
                  color: CustomColors.orangeColor, // <-- TextFormField input color
                ),
              ),
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: CustomColors.orangeColor, //<-- SEE HERE
              ),
              inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                contentPadding: EdgeInsets.zero,

                fillColor: CustomColors.lightGreyColor,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                suffixIconColor: CustomColors.greyColor,
                prefixIconColor: CustomColors.greyColor,
                focusColor: CustomColors.orangeColor,
                hintStyle: TextStyle(
                  fontFamily: 'CircularStd',
                  fontSize: 14.sp,
                  color: CustomColors.greyColor,
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.orangeColor),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Bruno\'s Kitchen' ,
            navigatorObservers: [routeObserver],
            initialRoute: '/',
            navigatorKey: navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            builder: EasyLoading.init(),
          );
        });
  }
}


