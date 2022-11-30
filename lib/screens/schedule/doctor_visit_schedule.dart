import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'widgets/card_doctor_visit_schedule.dart';

class DoctorVisitSchedule extends StatelessWidget {
  const DoctorVisitSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.horizontalPadding,
        vertical: Constant.verticalPadding,
      ),
      children: ["Jono", "Joni", "Jojo"].map((patient) {
        return GestureDetector(
          onTap: () {
             Navigator.pushNamed(context, RouteNames.patientData);
          },
          child: CardDoctorVisitSchedule(
              patientName: patient, visitDate: "10 November 2022"),
        );
      }).toList(),
    );
  }
}
