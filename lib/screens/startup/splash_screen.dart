import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/home/home_screen.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/view_model/auth_view_model/auth_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../auth/login_screen.dart';
import '../notification/notification_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 3000), () {
      context.read<AuthBloc>().add(CheckLogged());

      context.read<AuthBloc>().stream.listen((state) {
        if (state is IsLogin) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.navbar, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.login, (route) => false);
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() async {
    // final SharedPreferences _preferences =
    //     await SharedPreferences.getInstance();

    // String token = _preferences.getString("token")!;
    // print("CURRENT TOKEN : " + token);
    // if (token.isEmpty) {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, RouteNames.login, (route) => false);
    // } else {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, RouteNames.navbar, (route) => false);
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        speed: 50,
        pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
        backgroundColor: Constant.lightColor,
        colors: const [Colors.blue],
        navigateRoute: const NotficationScreen (),
        duration: 3000,
        imageSize: 600,
        imageSrc:
            "https://images.pexels.com/photos/14617972/pexels-photo-14617972.jpeg",
      ),
    );
  }
}
