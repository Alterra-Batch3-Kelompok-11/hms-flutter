import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/history_patients_approval_model.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'widgets/card_history_approval_patient.dart';

class HistoryApprovalPatient extends StatelessWidget {
  const HistoryApprovalPatient({Key? key, required this.listHistoryApproval})
      : super(key: key);

  final List<Historypatiensapprovals> listHistoryApproval;

  @override
  Widget build(BuildContext context) {
    return (listHistoryApproval.isEmpty)
        ? Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 60,
                right: 60,
              ),
              child: Text(
                "Tidak ada riwayat persetujuan untuk saat ini",
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
            itemCount: listHistoryApproval.length,
            itemBuilder: (context, index) {
              return CardHistoryApprovalPatient(
                patientName: listHistoryApproval[index].patientName,
                visitDate: listHistoryApproval[index].scheduleDateIndo,
                status: listHistoryApproval[index].status,
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: Constant.horizontalPadding,
              vertical: Constant.verticalPadding,
            ),
          );
  }
}
