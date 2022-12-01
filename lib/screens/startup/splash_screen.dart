import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      speed: 50,
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      backgroundColor: Constant.lightColor,
      colors: [Colors.blue],
      navigateRoute: LoginScreen(),
      duration: 500,
      imageSize: 600,
      imageSrc:
          "https://images.pexels.com/photos/14617972/pexels-photo-14617972.jpeg",
    );
  }
}
