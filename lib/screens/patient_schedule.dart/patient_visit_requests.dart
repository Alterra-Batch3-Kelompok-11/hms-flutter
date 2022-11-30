import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/patient_schedule.dart/widgets/card_patient_visit_request.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientVisitRequests extends StatelessWidget {
  const PatientVisitRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.horizontalPadding,
        vertical: Constant.verticalPadding,
      ),
      children: ["Jono", "Joni", "Jojo"].map((patientName) {
        return CardPatientVisitRequest(
            patientName: patientName,
            requestDate: "18-11-2022, 18:00",
            onAcceptButton: () {},
            onRejectButton: () {});
      }).toList(),
    );
  }
}
