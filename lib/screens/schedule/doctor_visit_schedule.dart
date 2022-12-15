import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/patient_data/patient_data_screen.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'package:hospital_management_system/models/outpatient_model.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import '../global_widgets/global_loading.dart';
import 'widgets/card_doctor_visit_schedule.dart';
import 'widgets/schedule_loading.dart';

class DoctorVisitSchedule extends StatefulWidget {
  const DoctorVisitSchedule({Key? key}) : super(key: key);

  @override
  State<DoctorVisitSchedule> createState() => _DoctorVisitScheduleState();
}

class _DoctorVisitScheduleState extends State<DoctorVisitSchedule> {
  @override
  void initState() {
    context.read<PatientBloc>().add(GetOutpatientApproveds());
    print("MEMBACA STATE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBloc, PatientState>(
      // buildWhen: (previous, current) {
      //   return current == OutpatientLoaded;
      // },
      builder: (context, state) {
        if (state is OutpatientLoaded) {
          print(state.outpatientList!.isEmpty);
          final List<OutpatientModel> outpatientList =
              state.outpatientList ?? [];
          if (outpatientList.isEmpty) {
            return Center(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 60,
                  right: 60,
                ),
                child: Text(
                  "Tidak ada jadwal kunjungan untuk saat ini",
                  style: Constant.primaryTextStyle.copyWith(
                    fontWeight: Constant.regularFontWeight,
                    fontSize: Constant.subtitleFontSize,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: Constant.horizontalPadding,
                vertical: Constant.verticalPadding,
              ),
              itemCount: outpatientList.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.patientData,
                        arguments: PatientDataScreen(
                          outSessionId: outpatientList[index].id,
                          patientId: outpatientList[index].patientId,
                        ));
                    print(outpatientList[index].id);
                  },
                  child: CardDoctorVisitSchedule(
                    queueNumber: index + 1,
                    patientName: outpatientList[index].patient.name,
                    scheduleDate: outpatientList[index].scheduleDateIndo,
                    scheduleTime: outpatientList[index].scheduleTime,
                  ),
                );
              }),
            );
          }
          // return const Text('Berhasil');
        } else if (state is PatientLoading) {
          return const GlobalLoading(layout: ScheduleLoading());
        } else if (state is PatientError) {
          return const SizedBox.shrink();
        } else {
          print("MASUK DISINI");
          return const GlobalLoading(layout: ScheduleLoading());
        }
        // if (state is OutpatientLoading) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // } else if (state is PatientError) {
        //   return Center(
        //     child: Text(state.message),
        //   );
        // } else if (state is OutpatientLoaded) {
        //   final List<OutpatientModel> outpatientList =
        //       state.outpatientList ?? [];
        //   if (outpatientList.isEmpty) {
        //     return Center(
        //       child: Text(
        //         "Tidak ada data",
        //         style: Constant.primaryTextStyle.copyWith(
        //           fontWeight: Constant.boldFontWeight,
        //           fontSize: Constant.firstTitleSize,
        //           color: Colors.black,
        //         ),
        //       ),
        //     );
        //   } else {
        //     return ListView(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: Constant.horizontalPadding,
        //         vertical: Constant.verticalPadding,
        //       ),
        //       children: ["Jono", "Joni", "Jojo"].map((patient) {
        //         return GestureDetector(
        //           onTap: () {
        //             Navigator.pushNamed(context, RouteNames.patientData);
        //           },
        //           child: CardDoctorVisitSchedule(
        //               patientName: patient, visitDate: "10 November 2022"),
        //         );
        //       }).toList(),
        //     );
        //   }
        // } else {
        //   return const Center(
        //     child: Text("Tidak ada data"),
        //   );
        // }
      },
    );
  }
}
