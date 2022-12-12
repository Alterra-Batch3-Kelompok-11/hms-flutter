import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/view_model/doctor_view_model/doctor_bloc.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';
import '../../utils/constant.dart';

import './widgets/list_doctor_card.dart';
import './widgets/pasient_count_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorBloc>().add(GetProfileDoctor());
    context.read<DoctorBloc>().add(GetScheduleAllDoctor());
    context.read<PatientBloc>().add(GetPatientQueueToday());
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo ',
                  style: Constant.primaryTextStyle.copyWith(
                    fontWeight: Constant.mediumFontWeight,
                    fontSize: Constant.firstTitleSize,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<DoctorBloc, DoctorState>(
                  buildWhen: ((previous, current) {
                    return current is ProfileDoctorLoaded;
                  }),
                  builder: (context, state) {
                    if (state is ProfileDoctorLoaded) {
                      print("DOCTOR MODEL NAME ${state.doctorModel.name}");
                      return Text(
                        state.doctorModel.name,
                        style: Constant.primaryTextStyle.copyWith(
                          fontWeight: Constant.boldFontWeight,
                          fontSize: Constant.firstTitleSize,
                          color: Colors.white,
                        ),
                      );
                    } else if (state is LoadingDoctor) {
                      return const SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: Constant.whiteColor,
                        ),
                      );
                    } else {
                      print("else dari appbar");
                      return const SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: Constant.whiteColor,
                        ),
                      );
                    }
                  },
                ),
              ],
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
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Constant.baseColor,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Constant.baseColor,
                    ),
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
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Constant.baseColor,
                    ),
                  );
                } else if (state is ErrorDoctorState) {
                  print(state.message);
                  return const SizedBox.shrink();
                } else {
                  print("else dari body");
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Constant.baseColor,
                    ),
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
