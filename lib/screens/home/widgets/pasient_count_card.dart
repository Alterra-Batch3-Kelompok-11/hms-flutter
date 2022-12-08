import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';



class PatientCountCard extends StatelessWidget {
  const PatientCountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: Constant.cardShadow,
      ),
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 22),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pasien Hari Ini',
            style: Constant.primaryTextStyle.copyWith(
              fontWeight: Constant.boldFontWeight,
              fontSize: Constant.subtitleFontSize,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 88,
                width: 140,
                decoration: BoxDecoration(
                  color: Constant.lightestColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '8',
                      style: Constant.primaryTextStyle.copyWith(
                        fontWeight: Constant.boldFontWeight,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      'Antrian',
                      style: Constant.primaryTextStyle.copyWith(
                        fontWeight: Constant.boldFontWeight,
                        fontSize: Constant.bodyFontSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 88,
                width: 140,
                decoration: BoxDecoration(
                  color: Constant.lightestColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '12',
                      style: Constant.primaryTextStyle.copyWith(
                        fontWeight: Constant.boldFontWeight,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      'Telah Berkunjung',
                      style: Constant.primaryTextStyle.copyWith(
                        fontWeight: Constant.boldFontWeight,
                        fontSize: Constant.bodyFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
