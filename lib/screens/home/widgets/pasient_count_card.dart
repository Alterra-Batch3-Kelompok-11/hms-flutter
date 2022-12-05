
import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PasienCountCard extends StatelessWidget {
  const PasienCountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: Constant.cardShadow,
      ),
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 88,
                //widht container pasien dibagi 2
                width: (MediaQuery.of(context).size.width -
                        Constant.horizontalPadding * 2 -
                        19 * 2 -
                        21) /
                    2,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF2F9),
                  border: Border.all(
                    color: const Color(0xFFEFEFEF),
                  ),
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
                    const SizedBox(height: 4),
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
                width: (MediaQuery.of(context).size.width -
                        Constant.horizontalPadding * 2 -
                        19 * 2 -
                        21) /
                    2,
                decoration: BoxDecoration(
                  //EBF2F9
                  color: const Color(0xFFEBF2F9),
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
                    const SizedBox(height: 4),
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
