import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/history/patient_consent_history.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'patient_visit_history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constant.lightColor,
          elevation: 0,
          title: Text(
            "Riwayat",
            style: Constant.primaryTextStyle.copyWith(
              fontWeight: Constant.boldFontWeight,
              fontSize: Constant.firstTitleSize,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.maxFinite, 50),
            child: Material(
              elevation: 1.5,
              color: Colors.white,
              child: TabBar(
                indicatorColor: Constant.baseColor,
                labelColor: Constant.baseColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelStyle: Constant.primaryTextStyle.copyWith(
                    fontWeight: Constant.boldFontWeight, fontSize: 13),
                unselectedLabelColor: const Color(0xff49454F),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                splashBorderRadius: BorderRadius.circular(12),
                tabs: const [
                  Tab(
                    text: "Riwayat Kunjungan",
                  ),
                  Tab(
                    text: "Riwayat Persetujuan",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            PatientVisitHistory(),
            PatientConsentHistory(),
          ],
        ),
      ),
    );
  }
}
