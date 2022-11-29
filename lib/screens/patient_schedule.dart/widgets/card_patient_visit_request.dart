import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/utils/constant.dart';

class CardPatientVisitRequest extends StatelessWidget {
  const CardPatientVisitRequest({
    Key? key,
    required this.patientName,
    required this.requestDate,
    required this.onAcceptButton,
    required this.onRejectButton,
  }) : super(key: key);

  final String patientName;
  final String requestDate;
  final void Function() onAcceptButton;
  final void Function() onRejectButton;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Constant.darker,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Request Kunjungan",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                  )),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Text(
                  patientName,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Flexible(
                child: Text(
                  requestDate,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                children: [
                  GlobalButton(
                    onPressed: onAcceptButton,
                    buttonTitle: "Terima",
                    fixedWidth: MediaQuery.of(context).size.width / 3,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GlobalButton(
                    onPressed: onRejectButton,
                    buttonTitle: "Tolak",
                    fixedWidth: MediaQuery.of(context).size.width / 3,
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
