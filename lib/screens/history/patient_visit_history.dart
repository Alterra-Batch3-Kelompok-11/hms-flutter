import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/global_widgets/global_loading.dart';
import 'package:hospital_management_system/screens/history/widgets/card_patient_visit_history.dart';
import 'package:hospital_management_system/screens/patient_data/patient_data_screen.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import '../schedule/widgets/schedule_loading.dart';

class PatientVisitHistory extends StatefulWidget {
  const PatientVisitHistory({Key? key}) : super(key: key);

  @override
  State<PatientVisitHistory> createState() => _PatientVisitHistoryState();
}

class _PatientVisitHistoryState extends State<PatientVisitHistory> {
  @override
  void initState() {
    context.read<PatientBloc>().add(GetHistoryVisit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBloc, PatientState>(builder: ((context, state) {
      if (state is PatientLoading) {
        print("tes {$state}");
        return const GlobalLoading(layout: ScheduleLoading());
      } else if (state is HistoryVisitLoaded) {
        if (state.historyList.isEmpty) {
          return const Center(
            child: Text("Tidak ada data"),
          );
        } else {
          return ListView.builder(
            itemCount: state.historyList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.patientData,
                      arguments: const PatientDataScreen(
                          outSessionId: 11, patientId: 3));
                },
                child: CardPatientVisitHistory(
                  status: state.historyList[index].status,
                  patientName: state.historyList[index].patientName,
                  visitDate: state.historyList[index].scheduleDateIndo,
                  queueNumber: index + 1,
                ),
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
    //     return CardPatientVisitHistory(
    //       patientName: patientName,
    //       visitDate: "08-11-2022 14:30",
    //       queueNumber: 2,
    //       isComplete: true,
    //     );
    //   }).toList(),
    // );
  }
}
