import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_builder.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/add_patient_data/add_patient_data_screen.dart';
import 'package:hospital_management_system/screens/auth/login_screen.dart';
import 'package:hospital_management_system/screens/home/home_screen.dart';
import 'package:hospital_management_system/screens/patient_data/patient_data_screen.dart';

import '../screens/profile/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// STARTUP ROUTE
      // case RouteName.splashScreen:
      //   return RouteBuilder(child: const SplashScreen());

      /// AUTH ROUTE
      case RouteNames.login:
        return RouteBuilder(child: LoginScreen());

      /// DOCTOR ROUTE
      case RouteNames.profile:
        return RouteBuilder(child: const ProfileScreen());
      case RouteNames.patientData:
        return RouteBuilder(child: const PatientDataScreen());
      case RouteNames.addPatientData:
        return RouteBuilder(child: const AddPatientDataScreen());
      case RouteNames.home:
        return RouteBuilder(child: HomeScreen());

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
