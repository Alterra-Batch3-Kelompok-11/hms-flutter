import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/home/widgets/doctor_home_header.dart';
import 'package:hospital_management_system/screens/home/widgets/list_doctor_loading.dart';
import 'package:hospital_management_system/screens/home/widgets/patient_count_loading.dart';
import 'package:hospital_management_system/view_model/doctor_view_model/doctor_bloc.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';
import '../../utils/constant.dart';

import '../global_widgets/global_loading.dart';
import './widgets/list_doctor_card.dart';
import 'widgets/pasient_count_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.dataUser}) : super(key: key);

  final AuthModel? dataUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool? isDoctor;
String profileKosong =
    'https://i.pinimg.com/564x/18/b5/b5/18b5b599bb873285bd4def283c0d3c09.jpg';

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientBloc>().add(GetPatientQueueToday());
    context.read<DoctorBloc>().add(GetScheduleAllDoctor());
  }

  // list data doctor
  @override
  Widget build(BuildContext context) {
    print("HOME DATA ${widget.dataUser!.name}");
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95),
        child: AppBar(
          backgroundColor: Constant.lightColor,
          toolbarHeight: 90,
          title: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: DoctorHomeHeader(
                  doctorName: widget.dataUser!.name,
                  profilePic: profileKosong)),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RouteNames.notification),
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: Constant.horizontalPadding,
            vertical: Constant.verticalPadding,
          ),
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
                } else if (state is ErrorDoctor) {
                  print(state.message);
                  return const SizedBox.shrink();
                } else {
                  return const GlobalLoading(
                    layout: ListDoctorLoading(),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
