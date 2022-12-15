import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class NurseHomeHeader extends StatelessWidget {
  const NurseHomeHeader({Key? key, required this.nurseName}) : super(key: key);

  final String nurseName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halo ',
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.mediumFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          nurseName,
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
