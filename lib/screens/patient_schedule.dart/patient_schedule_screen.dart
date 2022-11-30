import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/patient_schedule.dart/patient_visit_requests.dart';
import 'package:hospital_management_system/screens/patient_schedule.dart/patient_visit_schedule.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatienScheduleScreen extends StatelessWidget {
  const PatienScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constant.lightColor,
          elevation: 0,
          title: Text(
            "Jadwal",
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
                    text: "Permintaan Kunjungan",
                  ),
                  Tab(
                    text: "Jadwal Kunjungan",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            PatientVisitRequests(),
            PatientVisitSchedule(),
          ],
        ),
      ),
    );
  }
}
