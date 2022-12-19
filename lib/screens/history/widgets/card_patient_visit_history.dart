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
      padding: const EdgeInsets.symmetric(
        horizontal: Constant.verticalPadding,
        vertical: Constant.horizontalPadding,
      ),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Constant.whiteColor,
        borderRadius: Constant.cardBorderRadius,
        boxShadow: Constant.cardShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text("Antrian",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.captionFontSize,
                    fontWeight: Constant.regularFontWeight,
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                // padding: const EdgeInsets.all(10),
                width: 42,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: Constant.cardBorderRadius,
                  color: Constant.veryLightColor,
                ),
                child: Center(
                    child: Text(queueNumber.toString(),
                        style: Constant.primaryTextStyle.copyWith(
                            fontSize: Constant.firstTitleSize,
                            fontWeight: Constant.semiBoldFontWeight,
                            color: Constant.baseColor))),
              )
            ],
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Pasien",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.captionFontSize,
                    fontWeight: Constant.regularFontWeight,
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
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Tanggal Terima",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.captionFontSize,
                    fontWeight: Constant.regularFontWeight,
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
                    fontSize: Constant.bodyFontSize,
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
                  status,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.bodyFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                    color: Constant.baseColor,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  status,
                  style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      color: (status == "Proses")
                          ? Constant.processColor
                          : Constant.successColor,
                      fontWeight: Constant.semiBoldFontWeight),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 4,
          )
        ],
      ),
    );
  }
}
