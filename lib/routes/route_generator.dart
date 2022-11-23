import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_builder.dart';
import 'package:hospital_management_system/routes/route_name.dart';
import 'package:hospital_management_system/screens/auth/login_screen.dart';
import 'package:hospital_management_system/screens/startup/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// STARTUP ROUTE
      case RouteName.splashScreen:
        return RouteBuilder(child: const SplashScreen());
      case RouteName.login:
        return RouteBuilder(child: const LoginScreen());

      // AUTH ROUTE
      case RouteName.home:

      /// HOME ROUTE

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold();
    });
  }
}
