import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_generator.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/auth/login_screen.dart';
import 'package:hospital_management_system/screens/startup/splash_screen.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Widget splashscreen = SplashScreenView(
    //   speed: 50,
    //   pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
    //   backgroundColor: Constant.lightColor,
    //   colors: [Colors.blue],
    //   navigateRoute: LoginScreen(),
    //   duration: 500,
    //   imageSize: 600,
    //   imageSrc:
    //       "https://images.pexels.com/photos/14617972/pexels-photo-14617972.jpeg",
    // );
    
    
    
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      // initialRoute: RouteNames.splashScreen, 
      onGenerateRoute: RouteGenerator.generateRoute,
      home: SplashScreen(),
    );
  }
}
