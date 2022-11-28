import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/patient_data/widgets/patient_complaints_card.dart';
import 'package:hospital_management_system/screens/patient_data/widgets/patient_schedule_card.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'widgets/patient_medical_history_card.dart';
import 'widgets/patient_profile_card.dart';

class PatientDataScreen extends StatelessWidget {
  const PatientDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constant.lightColor,
        elevation: 0,
        title: Text(
          "Detail Pasien",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: Constant.horizontalPadding,
            vertical: Constant.verticalPadding),
        children: [
          Text(
            "Data Pasien",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.secondTitleFontSize,
              fontWeight: Constant.boldFontWeight,
            ),
          ),
          const PatientProfileCard(),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Waktu Kunjungan",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.secondTitleFontSize,
              fontWeight: Constant.boldFontWeight,
            ),
          ),
          const PatienScheduleCard(),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Keluhan",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.secondTitleFontSize,
              fontWeight: Constant.boldFontWeight,
            ),
          ),
          const PatientComplaintsCard(),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Riwayat Pasien",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.secondTitleFontSize,
              fontWeight: Constant.boldFontWeight,
            ),
          ),
          Column(
            children: [1, 2]
                .map(
                  (e) => const PatientMedicalHistoryCard(),
                )
                .toList(),
          ),
          const SizedBox(
            height: 24,
          ),
          GlobalButton(
              onPressed: () => Navigator.pushNamed(
                    context,
                    RouteNames.addPatientData,
                  ),
              buttonTitle: "Tambah Kondisi Pasien")
        ],
      ),
    );
  }
}
