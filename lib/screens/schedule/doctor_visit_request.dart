import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'widgets/card_doctor_visit_request.dart';

class DoctorVisitRequest extends StatelessWidget {
  const DoctorVisitRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.horizontalPadding,
        vertical: Constant.verticalPadding,
      ),
      children: ["Jono", "Joni", "Jojo"].map((patientName) {
        return CardDoctorVisitRequest(
            patientName: patientName,
            requestDate: "18-11-2022, 18:00",
            onAcceptButton: () {},
            onRejectButton: () {});
      }).toList(),
    );
  }
}
