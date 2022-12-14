import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/add_patient_data/add_patient_data_screen.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_loading.dart';
import 'package:hospital_management_system/screens/patient_data/widgets/patient_data_loading.dart';
import 'package:hospital_management_system/screens/patient_data/widgets/patient_profile_card.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/view_model/user_view_model/user_bloc.dart';
import '../../view_model/patient_view_model/patient_bloc.dart';
import 'widgets/patient_complaints_card.dart';
import 'widgets/patient_medical_history_card.dart';
import 'widgets/patient_schedule_card.dart';

class PatientDataScreen extends StatefulWidget {
  const PatientDataScreen({
    Key? key,
    required this.outSessionId,
    required this.patientId,
  }) : super(key: key);

  final int? outSessionId;
  final int? patientId;

  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  late int roleId;
  @override
  void initState() {
    print("PATIENT ID ${widget.patientId}");
    print("PATIENT ID ${widget.outSessionId}");
    final sessionId = widget.outSessionId;
    final patientId = widget.patientId;

    context.read<UserBloc>().add(GetUserRole());

    context.read<PatientBloc>().add(GetDetailOutpatient(
        outSessionId: widget.outSessionId!, patientId: widget.patientId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PatientBloc>().add(GetPatientSchedule());
        context.read<PatientBloc>().add(GetPatientHistory());
        context.read<UserBloc>().add(GetDataUser());
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Constant.backgroundColor,
        appBar: AppBar(
          backgroundColor: Constant.lightColor,
          elevation: 0,
          title: Text(
            "Detail Pasien",
            style: Constant.primaryTextStyle.copyWith(
              fontWeight: Constant.boldFontWeight,
              fontSize: Constant.firstTitleSize,
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<PatientBloc, PatientState>(
          builder: (context, state) {
            if (state is DetailOutpatientLoaded) {
              OutpatientModel outPatient = state.outpatientModel;

              print(state.historyList);
              return ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constant.horizontalPadding,
                    vertical: Constant.verticalPadding),
                children: [
                  Text(
                    "Data Pasien",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.secondTitleFontSize,
                      fontWeight: Constant.boldFontWeight,
                    ),
                  ),
                  PatientProfileCard(patient: outPatient.patient),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Waktu Kunjungan",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.secondTitleFontSize,
                      fontWeight: Constant.boldFontWeight,
                    ),
                  ),
                  PatienScheduleCard(
                      isFinish: outPatient.isFinish,
                      scheduleTime: outPatient.scheduleTime,
                      scheduleDateIndo: outPatient.scheduleDateIndo),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Keluhan",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.secondTitleFontSize,
                      fontWeight: Constant.boldFontWeight,
                    ),
                  ),
                  PatientComplaintsCard(
                    complaint: outPatient.complaint,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Riwayat Pasien",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.secondTitleFontSize,
                      fontWeight: Constant.boldFontWeight,
                    ),
                  ),
                  Column(
                    children: state.historyList
                        .map(
                          (data) =>
                              PatientMedicalHistoryCard(dataHistory: data),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserRoleLoaded) {
                        if (state.roleId == 2 && outPatient.isFinish == false) {
                          return GlobalButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              RouteNames.addPatientData,
                              arguments: AddPatientDataScreen(
                                  patientSessionId: outPatient.id,
                                  patientId: outPatient.patientId),
                            ),
                            buttonChild: Text(
                              "Terima",
                              style: Constant.primaryTextStyle.copyWith(
                                fontSize: Constant.subtitleFontSize,
                                fontWeight: Constant.semiBoldFontWeight,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  // Visibility(
                  //   visible: outPatient.isFinish,
                  //   child: GlobalButton(
                  //     onPressed: () => Navigator.pushNamed(
                  //       context,
                  //       RouteNames.navbar,
                  //       arguments: const NavbarScreen(selectedIndex: 0),
                  //     ),
                  //     // onPressed: () {
                  //     //   print(outPatient.id);
                  //     //   print(outPatient.patientId);
                  //     // },
                  //     buttonChild: Text(
                  //       "Kembali ke dashboard",
                  //       style: Constant.primaryTextStyle.copyWith(
                  //         fontSize: Constant.subtitleFontSize,
                  //         fontWeight: Constant.semiBoldFontWeight,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              );
            } else if (state is PatientError) {
              print(state.message);
              return const SizedBox.shrink();
            } else {
              return const GlobalLoading(
                layout: PatientDataLoading(),
              );
            }
          },
        ),
      ),
    );
  }
}
