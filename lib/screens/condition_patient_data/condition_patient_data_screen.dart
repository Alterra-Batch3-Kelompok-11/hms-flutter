import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class ConditionPatientDataScreen extends StatelessWidget {
  const ConditionPatientDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constant.lightColor,
        elevation: 0,
        title: Text(
          "Data Kondisi Pasien",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
