import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/schedule/doctor_visit_request.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/services/outpatient_service.dart';
import 'package:hospital_management_system/screens/schedule/doctor_visit_schedule.dart';
import 'package:hospital_management_system/screens/schedule/widgets/card_doctor_visit_request.dart';

//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/view_model/outpatient_view_model/outpatient_bloc.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  void initState() {
    context.read<OutpatientBloc>().add(GetOutpatientUnprocessed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constant.lightColor,
          elevation: 0,
          title: Text(
            "Jadwal",
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
                    text: "Permintaan Kunjungan",
                  ),
                  Tab(
                    text: "Jadwal Kunjungan",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<OutpatientBloc, OutpatientState>(
          builder: (context, state) {
            if (state is OutpatientLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Constant.baseColor,
                ),
              );
            }
            if (state is OutpatientLoaded) {
              final List<OutpatientModel> outpatientList =
                  state.outpatientList ?? [];

              return TabBarView(
                children: [
                  if (outpatientList.isNotEmpty)
                    DoctorVisitRequest(
                      outpatientList: outpatientList,
                    )
                  else
                    const Center(
                      child: Text("Tidak ada permintaan kunjungan"),
                    ),
                  DoctorVisitSchedule(),
                ],
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
