import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/utils/constant.dart';

class CardDoctorVisitRequest extends StatelessWidget {
  const CardDoctorVisitRequest({
    Key? key,
    required this.patientName,
    required this.requestDate,
    required this.requestTime,
    required this.isApproved,
    required this.onAcceptButton,
    required this.onRejectButton,
  }) : super(key: key);

  final String patientName;
  final String requestDate;
  final String requestTime;
  final int isApproved;
  final void Function() onAcceptButton;
  final void Function() onRejectButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Constant.horizontalPadding,
        right: Constant.horizontalPadding,
        top: Constant.horizontalPadding,
        bottom: 8,
      ),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Constant.whiteColor,
        borderRadius: Constant.cardBorderRadius,
        boxShadow: Constant.cardShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Constant.darker,
                size: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Request Kunjungan",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.bodyFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                  )),
            ],
          ),
          const Divider(
            height: 17,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Text(
                  patientName,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.bodyFontSize,
                    fontWeight: Constant.mediumFontWeight,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    requestDate,
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.mediumFontWeight,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    requestTime,
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.mediumFontWeight,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobalButton(
                    //snackbar
                    onPressed: onAcceptButton,
                   // onPressed: onAcceptButton,
                    buttonChild: Text(
                      "Terima",
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.captionFontSize,
                        fontWeight: Constant.mediumFontWeight,
                        color: Colors.white,
                      ),
                    ),
                    fixedWidth: 120,
                    fixedHeight: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  GlobalButton(
                    onPressed: onRejectButton,
                    buttonChild: Text(
                      "Tolak",
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.captionFontSize,
                        fontWeight: Constant.mediumFontWeight,
                        color: Colors.white,
                      ),
                    ),
                    fixedWidth: 120,
                    fixedHeight: 30,
                    color: Constant.errorColor,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
