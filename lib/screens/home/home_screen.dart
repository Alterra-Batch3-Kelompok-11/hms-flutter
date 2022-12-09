import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/home/widgets/list_doctor_card.dart';

import '../../utils/constant.dart';
import '../../view_model/doctor_view_model/doctor_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<DoctorBloc>().add(LoadDoctorBySchedule());
    super.initState();
  }


  // list data doctor
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        if (state is LoadingDoctor) {
          return const Center(
            child: CircularProgressIndicator(
              color: Constant.baseColor,
            ),
          );
        }
        if (state is ProfileDoctor) {
          final DoctorModel doctor = state.doctorModel;
          return Scaffold(
            backgroundColor: Constant.backgroundColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(95),
              child: AppBar(
                backgroundColor: Constant.lightColor,
                toolbarHeight: 90,
                title: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo ',
                        style: Constant.primaryTextStyle.copyWith(
                          fontWeight: Constant.mediumFontWeight,
                          fontSize: Constant.firstTitleSize,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Dr. ${doctor.name}',
                        style: Constant.primaryTextStyle.copyWith(
                          fontWeight: Constant.boldFontWeight,
                          fontSize: Constant.firstTitleSize,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, RouteNames.notification),
                    icon: const Icon(Icons.notifications),
                  ),
                ],
                leading: Transform.translate(
                  offset: const Offset(15, 0),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                leadingWidth: 50,
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<DoctorBloc, DoctorState>(
              builder: (context, state) {
                if (state is ListScheduleDoctorLoaded) {
                  return ListDoctorCard(doctorList: state.doctorList!);
                } else if (state is LoadingDoctor) {
                  return const Center(
                    child: CircularProgressIndicator(color: Constant.baseColor),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),

    );
  }
}
