import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'widgets/card_doctor_visit_request.dart';

class DoctorVisitRequest extends StatefulWidget {
  final List<OutpatientModel> outpatientList;
  const DoctorVisitRequest({Key? key, required this.outpatientList})
      : super(key: key);

  @override
  State<DoctorVisitRequest> createState() => _DoctorVisitRequestState();
}

class _DoctorVisitRequestState extends State<DoctorVisitRequest> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.horizontalPadding,
        vertical: Constant.verticalPadding,
      ),
      children: widget.outpatientList.map((outpatient) {
        return CardDoctorVisitRequest(
          patientName: outpatient.patient.name,
          requestDate: outpatient.scheduleDate,
          requestTime: outpatient.scheduleTime,
          onAcceptButton: () {},
          onRejectButton: () {},
        );
      }).toList(),
    );
  }
}
