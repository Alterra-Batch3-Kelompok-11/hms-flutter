import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/patient_data/patient_data_screen.dart';
import 'package:hospital_management_system/screens/schedule/widgets/card_nurse_schedule.dart';
import 'package:hospital_management_system/utils/constant.dart';

import 'package:hospital_management_system/models/outpatient_model.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import '../global_widgets/global_loading.dart';

import 'widgets/schedule_loading.dart';

class NurseSchedule extends StatefulWidget {
  NurseSchedule({Key? key, required this.outpatientList}) : super(key: key);

  List<OutpatientModel>? outpatientList;

  @override
  State<NurseSchedule> createState() => _NurseScheduleState();
}

class _NurseScheduleState extends State<NurseSchedule> {
  @override
  Widget build(BuildContext context) {
    if (widget.outpatientList!.isEmpty) {
      return Center(
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            left: 60,
            right: 60,
          ),
          child: Text(
            "Tidak ada jadwal kunjungan untuk saat ini",
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
        padding: const EdgeInsets.symmetric(
          horizontal: Constant.horizontalPadding,
          vertical: Constant.verticalPadding,
        ),
        itemCount: widget.outpatientList!.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.patientData,
                  arguments: PatientDataScreen(
                    outSessionId: widget.outpatientList![index].id,
                    patientId: widget.outpatientList![index].patientId,
                  ));
              print(widget.outpatientList![index].id);
            },
            child: CardNurseSchedule(
              queueNumber: index + 1,
              patientName: widget.outpatientList![index].patient.name,
              scheduleDate: widget.outpatientList![index].scheduleDateIndo,
              scheduleTime: widget.outpatientList![index].scheduleTime,
              isApproved: widget.outpatientList![index].isApproved,
              isFinished: widget.outpatientList![index].isFinish,
            ),
          );
        }),
      );
    }
  }
}
