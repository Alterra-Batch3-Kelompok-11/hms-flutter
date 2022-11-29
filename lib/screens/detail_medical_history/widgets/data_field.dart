import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class DataField extends StatelessWidget {
  const DataField({
    Key? key,
    required this.dataName,
    required this.dataValue,
  }) : super(key: key);

  final String dataName;
  final String dataValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              dataName,
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.bodyFontSize,
                fontWeight: Constant.semiBoldFontWeight,
              ),
            ),
          ),
          Flexible(
            child: Text(
              dataValue,
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.bodyFontSize,
                fontWeight: Constant.mediumFontWeight,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
