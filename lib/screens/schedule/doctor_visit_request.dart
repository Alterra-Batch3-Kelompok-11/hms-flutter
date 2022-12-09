import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/utils/constant.dart';
//bloc
import 'package:hospital_management_system/view_model/outpatient_view_model/outpatient_bloc.dart';

//util helper
import 'package:hospital_management_system/utils/helper_dialog.dart';

import 'widgets/card_doctor_visit_request.dart';

class DoctorVisitRequest extends StatefulWidget {
  // final List<OutpatientModel> outpatientList;
  // const DoctorVisitRequest({Key? key, required this.outpatientList})
  //     : super(key: key);

  const DoctorVisitRequest({Key? key}) : super(key: key);

  @override
  State<DoctorVisitRequest> createState() => _DoctorVisitRequestState();
}

class _DoctorVisitRequestState extends State<DoctorVisitRequest> {
  @override
  void initState() {
    context.read<OutpatientBloc>().add(GetOutpatientUnprocessed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutpatientBloc, OutpatientState>(
      builder: (context, state) {
        if (state is OutpatientLoaded) {
          final List<OutpatientModel> outpatientList =
              state.outpatientList ?? [];
          if (outpatientList.isEmpty) {
            return Center(
              child: Text(
                "Tidak ada data",
                style: Constant.primaryTextStyle.copyWith(
                  fontWeight: Constant.boldFontWeight,
                  fontSize: Constant.firstTitleSize,
                  color: Colors.white,
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
                      buttonSubmitText: "Ya",
                      buttonCancelText: "Batal",
                      buttonSubmitColor: Constant.baseColor,
                      //icon peringatan bulat
                      icon: Icons.report_gmailerrorred_sharp,
                      color: Constant.baseColor,
                      onSubmit: () {
                        //outpatient.isApproved = 1;
                        Navigator.pop(context);
                      },
                    );
                  },
                  onRejectButton: () {
                    HelperDialog.confirmationDialog(
                      context,
                      titleText: "Peringatan",
                      subTitle: "Apakah anda yakin ingin menolak pasien ini?",
                      buttonSubmitText: "Ya",
                      buttonCancelText: "Batal",
                      buttonSubmitColor: Constant.baseColor,
                      icon: Icons.dangerous_outlined,
                      color: Constant.errorColor,
                      onSubmit: () {
                        // outpatient.isApproved = 2;
                         Navigator.pop(context);
                      
                      },
                    );
                  },
                );
              }).toList(),
            );
          }
        } else if (state is OutpatientLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OutpatientError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
