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

import '../global_widgets/global_loading.dart';
import 'widgets/card_doctor_visit_request.dart';
import 'widgets/schedule_loading.dart';

class DoctorVisitRequest extends StatefulWidget {
  const DoctorVisitRequest({Key? key}) : super(key: key);

  @override
  State<DoctorVisitRequest> createState() => _DoctorVisitRequestState();
}

class _DoctorVisitRequestState extends State<DoctorVisitRequest> {
  @override
  void initState() {
    context.read<PatientBloc>().add(GetOutpatientUnprocessed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientBloc, PatientState>(
      listener: (context, state) {
        if (state is OutpatientApprovalSuccess) {
          //  if (state. == 1) {
          //    HelperDialog.snackBar(
          //      context: context,
          //      message: "Permintaan kunjungan berhasil disetujui",
          //    );
          //  }
          HelperDialog.snackBar(
            context: context,
            message: "Permintaan kunjungan berhasil disetujui",
            bottomMargin: 750,
          );

          // Navigator.pushNamedAndRemoveUntil(
          //     context, RouteNames.navbar, (route) => false,
          //     arguments: const NavbarScreen(
          //       selectedIndex: 1,
          //     ));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is OutpatientLoaded) {
          final List<OutpatientModel> outpatientList =
              state.outpatientList ?? [];
          if (outpatientList.isEmpty || outpatientList == []) {
            return Center(
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
            );
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: Constant.horizontalPadding,
                vertical: Constant.verticalPadding,
              ),
              children: outpatientList.map((outpatient) {
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
                        // HelperDialog.snackBar(
                        //   context: context,
                        //   message: "Permintaan kunjungan berhasil disetujui",
                        // );

                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, RouteNames.navbar, (route) => false,
                        //     arguments: const NavbarScreen(
                        //       selectedIndex: 1,
                        //     ));
                      },
                    );
                  },
                  onRejectButton: () {
                    HelperDialog.confirmationDialog(
                      context,
                      titleText: "Peringatan",
                      subTitle: "Apakah anda yakin ingin menolak pasien ini?",
                      buttonSubmitChild: Text(
                        "Ya",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: 15,
                          color: Constant.whiteColor,
                          fontWeight: Constant.mediumFontWeight,
                        ),
                        textAlign: TextAlign.center,
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
                          bottomMargin: 780,
                        );
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteNames.navbar, (route) => false,
                            arguments: const NavbarScreen(
                              selectedIndex: 1,
                            ));
                      },
                    );
                  },
                );
              }).toList(),
            );
          }
        } else if (state is PatientLoading) {
          return const GlobalLoading(layout: ScheduleLoading());
        } else if (state is PatientError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const GlobalLoading(layout: ScheduleLoading());
        }
      },
    );
  }
}
