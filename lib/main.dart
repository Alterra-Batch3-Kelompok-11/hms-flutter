import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/routes/route_generator.dart';
import 'package:hospital_management_system/services/auth_service.dart';
import 'package:hospital_management_system/view_model/auth_view_model/auth_bloc.dart';

import 'screens/startup/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => AuthService())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authService: context.read<AuthService>()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: RouteNames.login,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
