import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/screens/global_widgets/global_loading.dart';
import 'package:hospital_management_system/screens/schedule/doctor_visit_request.dart';
import 'package:hospital_management_system/screens/schedule/doctor_visit_schedule.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import 'widgets/schedule_loading.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({
    Key? key,
    this.dataUser,
  }) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();

  final AuthModel? dataUser;
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientBloc>().add(GetPatientSchedule());

    print("ROLE ID SCHEDULE SCREEN ${widget.dataUser!.roleId}");
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
              "Jadwal",
              style: Constant.primaryTextStyle.copyWith(
                fontWeight: Constant.boldFontWeight,
                fontSize: Constant.firstTitleSize,
                color: Colors.white,
              ),
            ),
            bottom: (widget.dataUser!.roleId == 2)
                ? PreferredSize(
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
                  )
                : const PreferredSize(
                    child: SizedBox.shrink(),
                    preferredSize: Size(double.maxFinite, 0),
                  ),
          ),
          body: (widget.dataUser!.roleId == 2)
              ? BlocBuilder<PatientBloc, PatientState>(
                  buildWhen: (previous, current) {
                    return current is PatientScheduleLoaded;
                  },
                  builder: (context, state) {
                    if (state is PatientScheduleLoaded) {
                      return TabBarView(
                        children: [
                          DoctorVisitRequest(
                              listOutpatientUnprocessed:
                                  state.listOutpatientUnprocessed),
                          DoctorVisitSchedule(
                              listOutPatientApproved:
                                  state.listOutpatientApproved),
                        ],
                      );
                    } else {
                      return const GlobalLoading(layout: ScheduleLoading());
                    }
                  },
                )
              : BlocBuilder<PatientBloc, PatientState>(
                  builder: (context, state) {
                    return Container();
                  },
                )),
    );
  }
}
