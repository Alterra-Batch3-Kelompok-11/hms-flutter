import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatienScheduleCard extends StatelessWidget {
  const PatienScheduleCard(
      {Key? key, required this.scheduleTime, required this.scheduleDateIndo})
      : super(key: key);

  final String scheduleTime;
  final String scheduleDateIndo;

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
            scheduleTime,
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
              scheduleDateIndo,
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
