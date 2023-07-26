
import 'package:brunos_kitchen/screens/logIn_screen.dart';
import 'package:brunos_kitchen/screens/otp_screen.dart';
import 'package:brunos_kitchen/screens/paw_points_screen.dart';
import 'package:brunos_kitchen/screens/register_user_continue_screen.dart';
import 'package:brunos_kitchen/screens/register_user_screen.dart';
import 'package:brunos_kitchen/screens/splash_screen.dart';
import 'package:brunos_kitchen/screens/user_verified_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const String splashRoute = '/';
const String loginRoute = '/login';
const String registerUserRoute = '/register_user';
const String registerUserContinueRoute = '/register_user_continue';
const String otpRoute = '/otp';
const String userVerifiedRoute = '/user_verified';
const String pawPointsRoute = '/paw_points';






class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerUserRoute:
        return MaterialPageRoute(builder: (_) => const RegisterUserScreen());
      case registerUserContinueRoute:
        return MaterialPageRoute(builder: (_) => const RegisterUserContinueScreen());
      case otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case userVerifiedRoute:
        return MaterialPageRoute(builder: (_) => const UserVerifiedScreen());
      case pawPointsRoute:
        return MaterialPageRoute(builder: (_) => const PawPointsScreen());
      case '/tasting_details':
      /*return MaterialPageRoute(
            builder: (_) => const TastingDetailsScreen(),
            settings: const RouteSettings(name: '/tasting_details'));*/
      case '/wines_details':
      /*return MaterialPageRoute(
            builder: (_) => WinesDetailScreen(
                  reviewButton: args,
                ));*/

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Something wrong in routes'),
        ),
      );
    });
  }
}
