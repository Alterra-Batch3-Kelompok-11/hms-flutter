import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/screens/global_widgets/global_loading.dart';
import 'package:hospital_management_system/screens/history/history_approval_patient.dart';
import 'package:hospital_management_system/utils/constant.dart';

import '../../view_model/patient_view_model/patient_bloc.dart';
import '../schedule/widgets/schedule_loading.dart';
import 'patient_visit_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientBloc>().add(GetPatientHistory());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constant.lightColor,
          elevation: 0,
          centerTitle: true,
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
        body: BlocBuilder<PatientBloc, PatientState>(
          builder: (context, state) {
            if (state is PatientHistoryLoaded) {
              return TabBarView(
                children: [
                  PatientVisitHistory(listHistoryVisit: state.historyList),
                  HistoryApprovalPatient(
                      listHistoryApproval: state.historyListApprovals),
                ],
              );
            } else {
              return const GlobalLoading(layout: ScheduleLoading());
            }
          },
        ),
      ),
    );
  }
}
