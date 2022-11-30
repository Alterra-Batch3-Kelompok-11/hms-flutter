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
      // theme: ThemeData(
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     selectedItemColor: Colors.red,
      //     unselectedItemColor: Colors.grey,
      //     backgroundColor: Colors.red,
      //     type: BottomNavigationBarType.fixed,
      //   ),
      //   tabBarTheme: TabBarTheme(
      //     indicator: BoxDecoration(
      //       color: Color.fromARGB(255, 136, 157, 174),
      //       borderRadius: BorderRadius.circular(50),

      //     ),
      //     unselectedLabelColor: Colors.black,
      //     labelStyle: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
