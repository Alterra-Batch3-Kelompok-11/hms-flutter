import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/screens/profile/widgets/detail_doctor_card.dart';
import 'package:hospital_management_system/screens/profile/widgets/list_jadwal_card.dart';
import 'package:hospital_management_system/utils/constant.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({Key? key, required this.doctor}) : super(key: key);

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: Constant.verticalPadding),
        DetailProfileCard(
            profilePic: doctor.profilePic == ''
                ? 'https://i.pinimg.com/564x/18/b5/b5/18b5b599bb873285bd4def283c0d3c09.jpg'
                : doctor.profilePic,
            doctorName: doctor.name,
            licenseNumber: doctor.licenseNumber,
            specialis: doctor.specialityName),
        ListJadwalCard(schedule: doctor.doctorSchedules),
      ],
    );
  }
}
