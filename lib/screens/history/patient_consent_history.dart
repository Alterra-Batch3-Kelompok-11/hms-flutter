import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/history/widgets/card_patient_consent_history.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientConsentHistory extends StatelessWidget {
  const PatientConsentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.horizontalPadding,
        vertical: Constant.verticalPadding,
      ),
      children: ["Jono", "Joni", "Jojo"].map((patientName) {
        return CardPatientConsentHistory(
          patientName: patientName,
          visitDate: "11-02-2022",
        );
      }).toList(),
    );
  }
}
