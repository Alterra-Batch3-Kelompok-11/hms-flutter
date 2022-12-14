import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/navbar/navbar.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/view_model/auth_view_model/auth_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2000), () {
      context.read<AuthBloc>().add(IsLogin());
      context.read<AuthBloc>().stream.listen((state) {
        print("AUTH STATE $state");
        if (state is AuthIsLogin) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.navbar, (route) => false,
              arguments: const NavbarScreen(
                selectedIndex: 0,
              ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        speed: 50,
        pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
        backgroundColor: Constant.lightColor,
        colors: const [Colors.blue],
        navigateRoute: const LoginScreen(),
        duration: 2000,
        imageSize: 600,
        imageSrc: "assets/images/splash_screen.png",
        // "https://images.pexels.com/photos/14617972/pexels-photo-14617972.jpeg",
      ),
    );
  }
}
