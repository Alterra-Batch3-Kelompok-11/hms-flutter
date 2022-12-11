import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class DetailProfileCard extends StatelessWidget {
  const DetailProfileCard({
    Key? key,
    required this.doctorName,
    required this.licenseNumber,
    required this.specialis,
  }) : super(key: key);

  final String doctorName;
  final String licenseNumber;
  final String specialis;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Constant.horizontalPadding,
        horizontal: 26,
      ),
      margin: const EdgeInsets.only(
        bottom: Constant.verticalPadding,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: Constant.cardShadow,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.firstTitleSize,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                licenseNumber,
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.subtitleFontSize,
                  fontWeight: Constant.regularFontWeight,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: 59,
                    child: Text(
                      'Spesialis',
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.bodyFontSize,
                        fontWeight: Constant.semiBoldFontWeight,
                      ),
                    ),
                  ),
                  Text(
                    ': ',
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                  Text(
                    specialis,
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.regularFontWeight,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 59,
                    child: Text(
                      'Jadwal ',
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.bodyFontSize,
                        fontWeight: Constant.semiBoldFontWeight,
                      ),
                    ),
                  ),
                  Text(
                    ': ',
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.bodyFontSize,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Senin - Jumat',
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.bodyFontSize,
                          fontWeight: Constant.regularFontWeight,
                        ),
                       // textAlign: TextAlign.left,
                      ),
                      Text(
                        '08.00 - 16.00',
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.bodyFontSize,
                          fontWeight: Constant.regularFontWeight,
                        ),
                     //   textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
