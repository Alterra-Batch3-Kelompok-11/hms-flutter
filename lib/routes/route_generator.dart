import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_builder.dart';
import 'package:hospital_management_system/routes/route_name.dart';
import 'package:hospital_management_system/screens/auth/login_screen.dart';
import 'package:hospital_management_system/screens/patient_data/patient_data_screen.dart';

import '../screens/profile/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// STARTUP ROUTE
      // case RouteName.splashScreen:
      //   return RouteBuilder(child: const SplashScreen());

      /// AUTH ROUTE
      case RouteName.login:
        return RouteBuilder(child:  LoginScreen());

      /// DOCTOR ROUTE
      case RouteName.profile:
        return RouteBuilder(child: const ProfileScreen());

      case RouteName.patientData:
        return RouteBuilder(child: const PatientDataScreen());

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
