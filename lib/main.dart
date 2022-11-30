import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_generator.dart';
import 'package:hospital_management_system/routes/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
