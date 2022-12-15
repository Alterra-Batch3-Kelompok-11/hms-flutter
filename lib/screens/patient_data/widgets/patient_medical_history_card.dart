import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/history_patient_treatment_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/detail_medical_history/detail_medical_history_screen.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientMedicalHistoryCard extends StatelessWidget {
  const PatientMedicalHistoryCard({Key? key, required this.dataHistory})
      : super(key: key);

  final HistoryPatientTreatmentModel dataHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(Constant.horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Constant.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Constant.lighterColor,
                ),
                child: Center(
                  child: Text(
                    dataHistory.scheduleDateIndo,
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Constant.lighterColor,
                ),
                child: Center(
                  child: Text(
                    dataHistory.doctor.name,
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                "Keluhan",
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.subtitleFontSize,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Text(
                  dataHistory.complaint,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                    fontWeight: Constant.regularFontWeight,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Obat",
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.subtitleFontSize,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Text(
                  dataHistory.medicine,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                    fontWeight: Constant.regularFontWeight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.detailMedicalHistory,
                      arguments:
                          DetailMedicalHistoryScreen(dataHistory: dataHistory));
                },
                child: Text(
                  "Selengkapnya",
                  style: Constant.secondaryTextStyle.copyWith(
                    fontSize: Constant.secondTitleFontSize,
                    fontWeight: Constant.boldFontWeight,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
