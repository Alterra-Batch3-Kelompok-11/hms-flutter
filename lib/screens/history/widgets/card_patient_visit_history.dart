import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class CardPatientVisitHistory extends StatelessWidget {
  const CardPatientVisitHistory({
    Key? key,
    required this.status,
    required this.patientName,
    required this.visitDate,
    required this.queueNumber,
    this.isComplete = false,
  }) : super(key: key);
  final String status;
  final String patientName;
  final String visitDate;
  final int queueNumber;
  final bool? isComplete;

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Antrian",
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.subtitleFontSize,
                  color: Constant.darker,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 75,
                height: 45,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: Constant.cardBorderRadius,
                  color: Constant.lightestColor,
                ),
                child: Center(
                  child: Text(
                    "$queueNumber",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.secondTitleFontSize,
                      fontWeight: Constant.boldFontWeight,
                      color: Constant.baseColor,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Pasien",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
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
                    fontSize: Constant.bodyFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                    color: Constant.baseColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Tanggal Kunjungan",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.captionFontSize,
                    color: Constant.darker,
                    fontWeight: Constant.regularFontWeight
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
                    fontSize: Constant.subtitleFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                    color: Constant.baseColor,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            status,
            style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.subtitleFontSize,
                color: (status == "Proses")
                    ? Constant.processColor
                    : Constant.successColor,
                fontWeight: Constant.semiBoldFontWeight),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
