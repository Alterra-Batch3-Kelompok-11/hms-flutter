import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class ScheduleLoading extends StatelessWidget {
  const ScheduleLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [1, 2, 3, 4, 5].map((e) {
        return Container(
          height: 80,
          decoration: BoxDecoration(
            color: Constant.whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
          width: double.infinity,
        );
      }).toList(),
    );
  }
}
