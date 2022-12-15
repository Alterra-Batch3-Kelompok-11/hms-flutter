import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/history_patient_treatment_model.dart';
import 'package:hospital_management_system/screens/detail_medical_history/widgets/data_field.dart';
import 'package:hospital_management_system/utils/constant.dart';

class DetailMedicalHistoryScreen extends StatelessWidget {
  const DetailMedicalHistoryScreen({Key? key, required this.dataHistory})
      : super(key: key);

  final HistoryPatientTreatmentModel dataHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constant.lightColor,
        elevation: 0,
        title: Text(
          "Selengkapnya",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        margin: const EdgeInsets.symmetric(
          horizontal: Constant.horizontalPadding,
          vertical: Constant.verticalPadding,
        ),
        padding: const EdgeInsets.all(Constant.verticalPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Constant.cardShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Riwayat Kesehatan",
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.firstTitleSize,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
              ),
            ),
            const Divider(
              height: 50,
              thickness: 1,
            ),
            DataField(
                dataName: "Waktu Kunjungan",
                dataValue: dataHistory.scheduleDateIndo),
            DataField(dataName: "Dokter", dataValue: dataHistory.doctor.name),
            DataField(dataName: "Keluhan", dataValue: dataHistory.complaint),
            DataField(dataName: "Kondisi", dataValue: dataHistory.description),
            DataField(dataName: "Obat", dataValue: dataHistory.medicine),
          ],
        ),
      ),
    );
  }
}
