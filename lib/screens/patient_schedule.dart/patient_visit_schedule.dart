import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/patient_schedule.dart/widgets/card_patient_visit_schedule.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientVisitSchedule extends StatelessWidget {
  const PatientVisitSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.horizontalPadding,
        vertical: Constant.verticalPadding,
      ),
      children: ["Jono", "Joni", "Jojo"].map((patient) {
        return GestureDetector(
          onTap: () {},
          child: CardPatientVisitSchedule(
              patientName: patient, visitDate: "10 November 2022"),
        );
      }).toList(),
    );
  }
}
