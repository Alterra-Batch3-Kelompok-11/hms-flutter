import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_loading.dart';
import 'package:hospital_management_system/screens/navbar/navbar.dart';
import 'package:hospital_management_system/screens/patient_data/widgets/patient_data_loading.dart';
import 'package:hospital_management_system/screens/patient_data/widgets/patient_profile_card.dart';
import 'package:hospital_management_system/utils/constant.dart';
import '../../view_model/patient_view_model/patient_bloc.dart';
import 'widgets/patient_complaints_card.dart';
import 'widgets/patient_medical_history_card.dart';
import 'widgets/patient_schedule_card.dart';

class PatientDataScreen extends StatefulWidget {
  const PatientDataScreen({Key? key, required this.patientId})
      : super(key: key);

  final int patientId;

  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  @override
  void initState() {
    print(widget.patientId);
    context
        .read<PatientBloc>()
        .add(GetDetailOutpatient(patientId: widget.patientId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(RouteNames.navbar, (route) => false,
                    arguments: const NavbarScreen(
                      selectedIndex: 1,
                    )),
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, state) {
          if (state is DetailOutpatientLoaded) {
            OutpatientModel outPatient = state.outpatientModel;

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
                  children: [1, 2]
                      .map(
                        (e) => const PatientMedicalHistoryCard(),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 24,
                ),
                GlobalButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RouteNames.addPatientData,
                    arguments: outPatient.id,
                  ),
                  // onPressed: () {
                  //   print(outPatient.id);
                  //   print(outPatient.patientId);
                  // },
                  buttonChild: Text(
                    "Terima",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.subtitleFontSize,
                      fontWeight: Constant.semiBoldFontWeight,
                      color: Colors.white,
                    ),
                  ),
                )
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
    );
  }
}
