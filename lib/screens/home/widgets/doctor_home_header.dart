import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class DoctorHomeHeader extends StatelessWidget {
  const DoctorHomeHeader({Key? key, required this.doctorName})
      : super(key: key);

  final String doctorName;

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
          doctorName,
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
