import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientDataLoading extends StatelessWidget {
  const PatientDataLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: Constant.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Constant.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width / 4,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Constant.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 15),
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Constant.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(bottom: 15),
          width: double.maxFinite,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            color: Constant.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(bottom: 15),
          width: double.maxFinite,
        ),
      ],
    );
  }
}
