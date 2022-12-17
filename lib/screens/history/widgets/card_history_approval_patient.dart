import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class CardHistoryApprovalPatient extends StatelessWidget {
  const CardHistoryApprovalPatient(
      {Key? key,
      required this.status,
      required this.patientName,
      required this.visitDate,
      this.isReceived = false})
      : super(key: key);
  final String status;
  final String patientName;
  final String visitDate;
  final bool? isReceived;

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
      child: Column(
        children: [
          Row(children: [
            Icon(
              Icons.circle,
              size: 15,
              color: (status == "Kunjungan Ditolak")
                  ? Constant.errorColor
                  : Constant.successColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              status,
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.subtitleFontSize,
                color: (status == "Kunjungan Ditolak")
                    ? Constant.errorColor
                    : Constant.successColor,
                fontWeight: Constant.semiBoldFontWeight,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ]),
          const Divider(
            height: 30,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  patientName,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                    color: Constant.darker,
                    fontWeight: Constant.semiBoldFontWeight,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                visitDate,
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.subtitleFontSize,
                  color: Constant.darker,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
