import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/home/widgets/doctor_home_header.dart';
import 'package:hospital_management_system/screens/home/widgets/list_doctor_loading.dart';
import 'package:hospital_management_system/screens/home/widgets/nurse_home_header.dart';
import 'package:hospital_management_system/screens/home/widgets/patient_count_loading.dart';
import 'package:hospital_management_system/view_model/auth_view_model/auth_bloc.dart';
import 'package:hospital_management_system/view_model/doctor_view_model/doctor_bloc.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';
import '../../utils/constant.dart';

import '../../view_model/nurse_view_model/nurse_bloc.dart';
import '../global_widgets/global_loading.dart';
import './widgets/list_doctor_card.dart';
import 'widgets/pasient_count_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool? isDoctor;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientBloc>().add(GetPatientQueueToday());
    context.read<DoctorBloc>().add(GetScheduleAllDoctor());

    context.read<AuthBloc>().stream.listen((state) {
      if (state is AuthRoleId) {
        if (state.roleId == 2) {
          isDoctor = true;
        } else {
          isDoctor = false;
        }
      }
    });

    if (isDoctor == true) {
      context.read<DoctorBloc>().add(GetProfileDoctor());
    } else {
      context.read<NurseBloc>().add(GetProfileNurse());
    }
  }

  // list data doctor
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95),
        child: AppBar(
          backgroundColor: Constant.lightColor,
          toolbarHeight: 90,
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: (isDoctor != true)
                ? BlocBuilder<NurseBloc, NurseState>(
                    builder: (context, state) {
                      if (state is NurseLoading) {
                        return GlobalLoading(
                          layout: Text(
                            'Halo ',
                            style: Constant.primaryTextStyle.copyWith(
                              fontWeight: Constant.mediumFontWeight,
                              fontSize: Constant.firstTitleSize,
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else if (state is NurseProfileLoaded) {
                        return NurseHomeHeader(nurseName: state.nurse.name);
                      } else {
                        return GlobalLoading(
                          layout: Text(
                            'Halo ',
                            style: Constant.primaryTextStyle.copyWith(
                              fontWeight: Constant.mediumFontWeight,
                              fontSize: Constant.firstTitleSize,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                  )
                : BlocBuilder<DoctorBloc, DoctorState>(
                    buildWhen: (previous, current) {
                      return current is ProfileDoctorLoaded;
                    },
                    builder: (context, state) {
                      if (state is ProfileDoctorLoaded) {
                        return DoctorHomeHeader(
                            doctorName: state.doctorModel.name);
                      } else if (state is LoadingDoctor) {
                        return GlobalLoading(
                          layout: Text(
                            'Halo ',
                            style: Constant.primaryTextStyle.copyWith(
                              fontWeight: Constant.mediumFontWeight,
                              fontSize: Constant.firstTitleSize,
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        return GlobalLoading(
                          layout: Text(
                            'Halo ',
                            style: Constant.primaryTextStyle.copyWith(
                              fontWeight: Constant.mediumFontWeight,
                              fontSize: Constant.firstTitleSize,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                  ),
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RouteNames.notification),
              icon: const Icon(Icons.notifications),
            ),
          ],
          leading: Transform.translate(
            offset: const Offset(15, 0),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          leadingWidth: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            BlocBuilder<PatientBloc, PatientState>(
              buildWhen: (previous, current) {
                return current is PatientQueueTodayLoaded;
              },
              builder: (context, state) {
                if (state is PatientQueueTodayLoaded) {
                  return PatientCountCard(
                      patientQueueToday: state.patientQueueToday);
                } else if (state is PatientLoading) {
                  return const GlobalLoading(
                    layout: PatientCountLoading(),
                  );
                } else {
                  return const GlobalLoading(
                    layout: PatientCountLoading(),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<DoctorBloc, DoctorState>(
              buildWhen: (previous, current) {
                return current is ScheduleAllDoctorLoaded;
              },
              builder: (context, state) {
                if (state is ScheduleAllDoctorLoaded) {
                  List<DoctorModel> doctorList = state.doctorList;
                  return ListDoctorCard(doctorList: doctorList);
                } else if (state is LoadingDoctor) {
                  return const GlobalLoading(
                    layout: ListDoctorLoading(),
                  );
                } else if (state is ErrorDoctorState) {
                  print(state.message);
                  return const SizedBox.shrink();
                } else {
                  return const GlobalLoading(
                    layout: ListDoctorLoading(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
