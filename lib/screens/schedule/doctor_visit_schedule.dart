import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/patient_data/patient_data_screen.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'package:hospital_management_system/models/outpatient_model.dart';
//bloc

import 'widgets/card_doctor_visit_schedule.dart';

class DoctorVisitSchedule extends StatelessWidget {
  const DoctorVisitSchedule({Key? key, required this.listOutPatientApproved})
      : super(key: key);

  final List<OutpatientModel> listOutPatientApproved;

  @override
  Widget build(BuildContext context) {
    return (listOutPatientApproved.isEmpty)
        ? Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 60,
                right: 60,
              ),
              child: Text(
                "Tidak ada permintaan kunjungan untuk saat ini",
                style: Constant.primaryTextStyle.copyWith(
                  fontWeight: Constant.regularFontWeight,
                  fontSize: Constant.subtitleFontSize,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: Constant.horizontalPadding,
              vertical: Constant.verticalPadding,
            ),
            itemCount: listOutPatientApproved.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.patientData,
                      arguments: PatientDataScreen(
                        outSessionId: listOutPatientApproved[index].id,
                        patientId: listOutPatientApproved[index].patientId,
                      ));
                  print(listOutPatientApproved[index].id);
                },
                child: CardDoctorVisitSchedule(
                  queueNumber: index + 1,
                  patientName: listOutPatientApproved[index].patient.name,
                  scheduleDate: listOutPatientApproved[index].scheduleDateIndo,
                  scheduleTime: listOutPatientApproved[index].scheduleTime,
                ),
              );
            }),
          );
  }
}
