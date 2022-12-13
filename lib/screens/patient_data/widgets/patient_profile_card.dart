import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/patient_model.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientProfileCard extends StatelessWidget {
  const PatientProfileCard({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(Constant.horizontalPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: Constant.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            patient.name,
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.secondTitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "NIK : ${patient.nik}",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Tempat, Tanggal Lahir",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            patient.birthDate,
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Jenis Kelamin",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            (patient.gender == 1) ? "Pria" : "Wanita",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Agama",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Islam",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Status Pernikahan",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            (patient.maritalStatus == true) ? "Sudah menikan" : "Belum menikah",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Alamat",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            patient.address,
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
