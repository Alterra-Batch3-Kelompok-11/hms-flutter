import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/history/widgets/card_patient_visit_history.dart';
import 'package:hospital_management_system/utils/constant.dart';

import '../../models/history_patiens_model.dart';

class PatientVisitHistory extends StatelessWidget {
  const PatientVisitHistory({Key? key, required this.listHistoryVisit})
      : super(key: key);

  final List<Historypatiens> listHistoryVisit;

  @override
  Widget build(BuildContext context) {
    return (listHistoryVisit.isEmpty)
        ? Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 60,
                right: 60,
              ),
              child: Text(
                "Belum ada riwayat kunjungan untuk saat ini",
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
            itemCount: listHistoryVisit.length,
            itemBuilder: (context, index) {
              return CardPatientVisitHistory(
                status: listHistoryVisit[index].status,
                patientName: listHistoryVisit[index].patientName,
                visitDate: listHistoryVisit[index].scheduleDateIndo,
                queueNumber: index + 1,
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: Constant.horizontalPadding,
              vertical: Constant.verticalPadding,
            ),
          );
  }
}
