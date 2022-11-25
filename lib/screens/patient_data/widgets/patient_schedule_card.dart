import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatienScheduleCard extends StatelessWidget {
  const PatienScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(Constant.horizontalPadding),
          decoration: BoxDecoration(
            color: Constant.lighterColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Constant.cardShadow,
          ),
          child: Center(
              child: Text(
            "09.30",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          )),
        ),
        const SizedBox(
          width: Constant.horizontalPadding,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(Constant.horizontalPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Constant.cardShadow,
          ),
          child: Center(
            child: Text(
              "Kamis, 17 November 2022",
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.subtitleFontSize,
                fontWeight: Constant.semiBoldFontWeight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
