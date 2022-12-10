import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/services/outpatient_service.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import 'widgets/card_doctor_visit_schedule.dart';

class DoctorVisitSchedule extends StatefulWidget {
  const DoctorVisitSchedule({Key? key}) : super(key: key);

  @override
  State<DoctorVisitSchedule> createState() => _DoctorVisitScheduleState();
}

class _DoctorVisitScheduleState extends State<DoctorVisitSchedule> {
  @override
  void initState() {
    context.read<PatientBloc>().add(GetOutpatientProcessed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBloc, PatientState>(
      builder: (context, state) {
        if (state is PatientError) {
          return Text(state.message);
        }
        if (state is OutpatientLoaded) {
          print(state.outpatientList!.isEmpty);
          final List<OutpatientModel> outpatientList =
              state.outpatientList ?? [];
          if (outpatientList.isEmpty) {
            return Center(
              child: Text(
                "Tidak ada data",
                style: Constant.primaryTextStyle.copyWith(
                  fontWeight: Constant.boldFontWeight,
                  fontSize: Constant.firstTitleSize,
                  color: Colors.black,
                ),
              ),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: Constant.horizontalPadding,
                vertical: Constant.verticalPadding,
              ),
              children: outpatientList.map((outpatient) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.patientData);
                  },
                  child: CardDoctorVisitSchedule(
                    patientName: outpatient.patient.name,
                    visitDate: outpatient.scheduleDate,
                  ),
                );
              }).toList(),
            );
          }
          // return const Text('Berhasil');
        } else {
          return const SizedBox();
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
