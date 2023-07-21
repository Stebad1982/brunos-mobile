import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/utils/custom_colors.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
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
    ..progressColor = CustomColors.color4
    ..backgroundColor = CustomColors.color1
    ..indicatorColor = CustomColors.color4
    ..textColor = CustomColors.color4
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
Future<void> main() async{

  configLoading();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthViewModel(),
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
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
          /*  localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,*/
            theme: ThemeData(
              primaryColor: CustomColors.color1,
              colorScheme: ThemeData().colorScheme.copyWith(
                secondary: CustomColors.color1,
                primary: CustomColors.color2,
              ),
              textTheme: TextTheme(
                subtitle1: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 12.sp,
                  color: CustomColors.color2, // <-- TextFormField input color
                ),
              ),
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: CustomColors.color2, //<-- SEE HERE
              ),
              inputDecorationTheme: InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                suffixIconColor: CustomColors.color3,
                prefixIconColor: CustomColors.color3,
                focusColor: CustomColors.color1,
                hintStyle: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.color1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Welcome Customer',
            navigatorObservers: [routeObserver],
            initialRoute: '/',
            navigatorKey: navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            builder: EasyLoading.init(),
          );
        });
  }
}


