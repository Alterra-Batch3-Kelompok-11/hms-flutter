import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientComplaintsCard extends StatelessWidget {
  const PatientComplaintsCard({Key? key}) : super(key: key);

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
      child: Text(
        "Batuk, Pilek, Pusing",
        style: Constant.primaryTextStyle.copyWith(
          fontSize: Constant.subtitleFontSize,
          fontWeight: Constant.semiBoldFontWeight,
        ),
      ),
    );
  }
}
