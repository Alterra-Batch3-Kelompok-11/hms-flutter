import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/navbar/navbar.dart';
import 'package:hospital_management_system/utils/constant.dart';
//bloc

//util helper
import 'package:hospital_management_system/utils/helper_dialog.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import 'widgets/card_doctor_visit_request.dart';

class DoctorVisitRequest extends StatefulWidget {
  const DoctorVisitRequest({Key? key, required this.listOutpatientUnprocessed})
      : super(key: key);

  @override
  State<DoctorVisitRequest> createState() => _DoctorVisitRequestState();

  final List<OutpatientModel> listOutpatientUnprocessed;
}

class _DoctorVisitRequestState extends State<DoctorVisitRequest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<PatientBloc>().stream.listen((state) {
      if (state is OutpatientApprovalSuccess) {
        // Navigator.pushNamedAndRemoveUntil(
        //         context, RouteNames.navbar, (route) => false,
        //         arguments: const NavbarScreen(
        //           selectedIndex: 1,
        //         ))
        //     .then((value) =>
        //         context.read<PatientBloc>().add(GetPatientSchedule()));
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.navbar, (route) => false,
                arguments: const NavbarScreen(
                  selectedIndex: 1,
                ));
        context.read<PatientBloc>().add(GetPatientSchedule());
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.listOutpatientUnprocessed.isEmpty)
        ? Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 60,
                right: 60,
              ),
              child: Text(
                "Tidak ada permintaan kunjungan untuk saat ini",
                style: Constant.primaryTextStyle.copyWith(
                  fontWeight: Constant.regularFontWeight,
                  fontSize: Constant.subtitleFontSize,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: Constant.horizontalPadding,
              vertical: Constant.verticalPadding,
            ),
            children: widget.listOutpatientUnprocessed.map((outpatient) {
              return CardDoctorVisitRequest(
                patientName: outpatient.patient.name,
                requestDate: outpatient.scheduleDate,
                requestTime: outpatient.scheduleTime,
                isApproved: outpatient.isApproved,
                onAcceptButton: () {
                  HelperDialog.confirmationDialog(
                    context,
                    titleText: "Pemberitahuan",
                    subTitle: "Apakah anda yakin ingin menerima pasien ini?",
                    buttonSubmitChild: BlocBuilder<PatientBloc, PatientState>(
                      builder: (context, state) {
                        if (state is PatientLoading) {
                          return const SizedBox(
                            height: 30,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Constant.whiteColor,
                              strokeWidth: 2,
                            ),
                          );
                        } else {
                          return Text(
                            "Ya",
                            style: Constant.primaryTextStyle.copyWith(
                              fontSize: 15,
                              color: Constant.whiteColor,
                              fontWeight: Constant.mediumFontWeight,
                            ),
                            textAlign: TextAlign.center,
                          );
                        }
                      },
                    ),
                    buttonCancelText: "Batal",

                    ///icon peringatan bulat
                    icon: SvgPicture.asset(
                      "assets/icons/pemberitahuan_icon.svg",
                      color: Constant.baseColor,
                    ),

                    /// icon: Icons.report_gmailerrorred_sharp,
                    color: Constant.baseColor,
                    onSubmit: () {
                      context.read<PatientBloc>().add(PutOutpatientApproval(
                          idOutpatient: outpatient.id, isApproved: 1));
                      HelperDialog.snackBar(
                        context: context,
                        message: "Permintaan kunjungan berhasil disetujui",
                        bottomMargin: 750,
                      );
                    },
                  );
                },
                onRejectButton: () {
                  HelperDialog.confirmationDialog(
                    context,
                    titleText: "Peringatan",
                    subTitle: "Apakah anda yakin ingin menolak pasien ini?",
                    buttonSubmitChild: BlocBuilder<PatientBloc, PatientState>(
                      builder: (context, state) {
                        if (state is PatientLoading) {
                          return const SizedBox(
                            height: 30,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Constant.whiteColor,
                              strokeWidth: 2,
                            ),
                          );
                        } else {
                          return Text(
                            "Ya",
                            style: Constant.primaryTextStyle.copyWith(
                              fontSize: 15,
                              color: Constant.whiteColor,
                              fontWeight: Constant.mediumFontWeight,
                            ),
                            textAlign: TextAlign.center,
                          );
                        }
                      },
                    ),
                    buttonCancelText: "Batal",
                    icon: SvgPicture.asset(
                      "assets/icons/peringatan_icon.svg",
                      color: Constant.errorColor,
                    ),
                    //icon: Icons.dangerous_outlined,
                    color: Constant.errorColor,
                    onSubmit: () {
                      context.read<PatientBloc>().add(PutOutpatientApproval(
                          idOutpatient: outpatient.id, isApproved: 2));
                      HelperDialog.snackBar(
                        context: context,
                        message: "Permintaan kunjungan berhasil ditolak",
                        bottomMargin: 750,
                      );
                    },
                  );
                },
              );
            }).toList(),
          );
  }
}
