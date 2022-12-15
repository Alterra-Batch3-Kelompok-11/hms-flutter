import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/routes/route_generator.dart';
import 'package:hospital_management_system/services/auth_service.dart';
import 'package:hospital_management_system/services/doctor_service.dart';
import 'package:hospital_management_system/services/local_service.dart';
import 'package:hospital_management_system/services/nurse_service.dart';
import 'package:hospital_management_system/services/patient_service.dart';

import 'package:hospital_management_system/view_model/auth_view_model/auth_bloc.dart';
import 'package:hospital_management_system/view_model/doctor_view_model/doctor_bloc.dart';
import 'package:hospital_management_system/view_model/nurse_view_model/nurse_bloc.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import 'routes/route_names.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env_development");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LocalService()),
        RepositoryProvider(create: (context) => AuthService()),
        RepositoryProvider(create: (context) => DoctorService()),
        RepositoryProvider(create: (context) => PatientService()),
        RepositoryProvider(create: (context) => NurseService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                    context.read<AuthService>(),
                    context.read<LocalService>(),
                  )..add(IsExpiredToken())),
          BlocProvider(
              create: (context) => DoctorBloc(
                    context.read<DoctorService>(),
                    context.read<LocalService>(),
                  )),
          BlocProvider(
              create: (context) => PatientBloc(
                    context.read<PatientService>(),
                    context.read<LocalService>(),
                  )),
          BlocProvider(
              create: (context) => NurseBloc(
                    context.read<NurseService>(),
                    context.read<LocalService>(),
                  )),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
