import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientMedicalHistoryCard extends StatelessWidget {
  const PatientMedicalHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(Constant.horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Constant.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Constant.lighterColor,
                ),
                child: Center(
                  child: Text(
                    "17 Oktober 2022",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Constant.lighterColor,
                ),
                child: Center(
                  child: Text(
                    "Dr Bones",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                "Keluhan",
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.subtitleFontSize,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Text(
                  "Batuk, Pilek, Pusing",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                    fontWeight: Constant.regularFontWeight,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Obat",
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.subtitleFontSize,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Text(
                  "Sirup anti dahak",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                    fontWeight: Constant.regularFontWeight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Selengkapnya",
                  style: Constant.secondaryTextStyle.copyWith(
                    fontSize: Constant.secondTitleFontSize,
                    fontWeight: Constant.boldFontWeight,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
