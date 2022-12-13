import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientComplaintsCard extends StatelessWidget {
  const PatientComplaintsCard({Key? key, required this.complaint})
      : super(key: key);

  final String complaint;

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
        complaint,
        style: Constant.primaryTextStyle.copyWith(
          fontSize: Constant.subtitleFontSize,
          fontWeight: Constant.semiBoldFontWeight,
        ),
      ),
    );
  }
}
