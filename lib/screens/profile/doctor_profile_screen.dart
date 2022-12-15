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
            doctorName: doctor.name,
            licenseNumber: doctor.licenseNumber,
            specialis: doctor.specialityName),
        ListJadwalCard(schedule: doctor.doctorSchedules),
      ],
    );
  }
}
