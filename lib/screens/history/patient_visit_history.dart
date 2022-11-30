import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/history/widgets/card_patient_visit_history.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientVisitHistory extends StatelessWidget {
  const PatientVisitHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.horizontalPadding,
        vertical: Constant.verticalPadding,
      ),
      children: ["Jono", "Joni", "Jojo"].map((patientName) {
        return CardPatientVisitHistory(
          patientName: patientName,
          visitDate: "08-11-2022 14:30",
          queueNumber: 2,
          isComplete: true,
        );
      }).toList(),
    );
  }
}
