import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/screens/history/widgets/card_patient_consent_history.dart';
import 'package:hospital_management_system/utils/constant.dart';

import '../../view_model/patient_view_model/patient_bloc.dart';
import '../global_widgets/global_loading.dart';
import '../schedule/widgets/schedule_loading.dart';

class PatientConsentHistory extends StatefulWidget {
  const PatientConsentHistory({Key? key}) : super(key: key);

  @override
  State<PatientConsentHistory> createState() => _PatientConsentHistoryState();
}

class _PatientConsentHistoryState extends State<PatientConsentHistory> {
  @override
  void initState() {
    context.read<PatientBloc>().add(GetHistoryApprovals());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBloc, PatientState>(builder: ((context, state) {
      if (state is PatientLoading) {
        return const GlobalLoading(layout: ScheduleLoading());
      } else if (state is HistoryApprovalsLoaded) {
        if (state.historyListApprovals.isEmpty) {
          return Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 60,
                right: 60,
              ),
              child: Text(
                "Tidak ada riwayat persetujuan untuk saat ini",
                style: Constant.primaryTextStyle.copyWith(
                  fontWeight: Constant.regularFontWeight,
                  fontSize: Constant.subtitleFontSize,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: state.historyListApprovals.length,
            itemBuilder: (context, index) {
              return CardPatientConsentHistory(
                patientName: state.historyListApprovals[index].patientName,
                visitDate: state.historyListApprovals[index].scheduleDateIndo,
                status: state.historyListApprovals[index].status,
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: Constant.horizontalPadding,
              vertical: Constant.verticalPadding,
            ),
          );
        }
      } else if (state is PatientError) {
        return const SizedBox.shrink();
      } else {
        return const GlobalLoading(layout: ScheduleLoading());
      }
    }));
    // return ListView(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: Constant.horizontalPadding,
    //     vertical: Constant.verticalPadding,
    //   ),
    //   children: ["Jono", "Joni", "Jojo"].map((patientName) {
    //     return CardPatientConsentHistory(
    //       patientName: patientName,
    //       visitDate: "11-02-2022",
    //     );
    //   }).toList(),
    // );
  }
}
