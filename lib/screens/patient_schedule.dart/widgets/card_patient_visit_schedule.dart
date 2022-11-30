import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class CardPatientVisitSchedule extends StatelessWidget {
  const CardPatientVisitSchedule({
    Key? key,
    required this.patientName,
    required this.visitDate,
  }) : super(key: key);

  final String patientName;
  final String visitDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constant.horizontalPadding),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Constant.whiteColor,
        borderRadius: Constant.cardBorderRadius,
        boxShadow: Constant.cardShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Pasien",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.secondTitleFontSize,
                    color: Constant.darker,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  patientName,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.secondTitleFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                    color: Constant.baseColor,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Tanggal Terima",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.secondTitleFontSize,
                    color: Constant.darker,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  visitDate,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.secondTitleFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                    color: Constant.baseColor,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            "Diterima",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              color: Constant.successColor,
              fontWeight: Constant.mediumFontWeight,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.arrow_right,
            color: Constant.baseColor,
          )
        ],
      ),
    );
  }
}
