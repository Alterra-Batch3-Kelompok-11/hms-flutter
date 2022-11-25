import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientProfileCard extends StatelessWidget {
  const PatientProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(Constant.horizontalPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: Constant.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jono",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.secondTitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "NIK : 33927100498492",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Tempat, Tanggal Lahir",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Jakarta, 28 Juni 1993",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Jenis Kelamin",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Pria",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Agama",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Islam",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Status Pernikahan",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Sudah Menikah",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Alamat",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Condet, Jakarta Timur",
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
