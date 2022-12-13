import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class DetailDoctorLoading extends StatelessWidget {
  const DetailDoctorLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constant.whiteColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Constant.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Constant.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Constant.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Constant.whiteColor,
              borderRadius: BorderRadius.circular(5)),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Constant.processColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [1, 2, 3, 4, 5, 6, 7].map((e) {
              return Container(
                margin: const EdgeInsets.only(top: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Constant.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
