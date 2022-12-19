import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class CardNurseSchedule extends StatelessWidget {
  const CardNurseSchedule({
    Key? key,
    required this.patientName,
    required this.scheduleDate,
    required this.scheduleTime,
    required this.isApproved,
    required this.isFinished,
    required this.queueNumber,
  }) : super(key: key);

  final String patientName;
  final String scheduleDate;
  final String scheduleTime;
  final int isApproved;
  final bool isFinished;
  final int queueNumber;

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
            width: 20,
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
                  "Tanggal Kunjungan",
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
                  scheduleDate,
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
                  scheduleTime,
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
                (isApproved == 1)
                    ? Text(
                        "Diterima",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.bodyFontSize,
                          color: Constant.successColor,
                          fontWeight: Constant.mediumFontWeight,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        "Sedang\ndiproses",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.bodyFontSize,
                          color: Colors.grey,
                          fontWeight: Constant.mediumFontWeight,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                const SizedBox(
                  width: 9,
                ),
                const Icon(
                  Icons.arrow_right,
                  color: Constant.baseColor,
                )
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
