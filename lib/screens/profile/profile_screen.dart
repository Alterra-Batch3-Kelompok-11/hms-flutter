import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/screens/profile/widgets/detail_doctor_card.dart';
import 'package:hospital_management_system/screens/profile/widgets/list_jadwal_card.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/view_model/doctor_view_model/doctor_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<DoctorBloc>().add(GetProfileDoctor());
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
          "Akun Saya",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Constant.horizontalPadding,
        ),
        child: BlocBuilder<DoctorBloc, DoctorState>(
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
              return ListView(
                children: [
                  const SizedBox(height: Constant.verticalPadding),
                  DetailProfileCard(
                      doctorName: doctor.name,
                      licenseNumber: doctor.licenseNumber,
                      specialis: doctor.specialityName),
                  ListJadwalCard(schedule: doctor.doctorSchedules),
                  const SizedBox(height: Constant.verticalPadding),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
