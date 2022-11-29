import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/detail_medical_history/widgets/data_field.dart';
import 'package:hospital_management_system/utils/constant.dart';

class DetailMedicalHistoryScreen extends StatelessWidget {
  const DetailMedicalHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constant.lightColor,
        elevation: 0,
        title: Text(
          "Selengkapnya",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        margin: const EdgeInsets.symmetric(
          horizontal: Constant.horizontalPadding,
          vertical: Constant.verticalPadding,
        ),
        padding: const EdgeInsets.all(Constant.verticalPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Constant.cardShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Riwayat Kesehatan",
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.firstTitleSize,
                  fontWeight: Constant.semiBoldFontWeight,
                ),
              ),
            ),
            const Divider(
              height: 50,
              thickness: 1,
            ),
            const DataField(
                dataName: "Waktu Kunjungan", dataValue: "17 November 2022"),
            const DataField(dataName: "Dokter", dataValue: "Dr. Bones"),
            const DataField(
                dataName: "Keluhan", dataValue: "Batuk, Pilek, Pusing"),
            const DataField(
                dataName: "Kondisi",
                dataValue:
                    "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quis quas enim nam officia culpa consectetur corrupti quos sequi non, reiciendis excepturi, distinctio odio fuga. Iure, libero incidunt. Consequatur, tempore quod eos corporis quo eveniet, quibusdam minima est atque cum perferendis, impedit culpa. Et esse quo dolorem veniam perspiciatis ipsam minima."),
            const DataField(dataName: "Obat", dataValue: "Fix formula 44"),
          ],
        ),
      ),
    );
  }
}
