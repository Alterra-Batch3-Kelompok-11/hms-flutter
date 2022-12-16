import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/nurse_model.dart';
import 'package:hospital_management_system/screens/profile/widgets/detail_doctor_card.dart';
import 'package:hospital_management_system/screens/profile/widgets/list_jadwal_card.dart';
import 'package:hospital_management_system/utils/constant.dart';

class NurseProfileScreen extends StatelessWidget {
  const NurseProfileScreen({Key? key, required this.nurse}) : super(key: key);

  final NurseModel nurse;
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: Constant.verticalPadding),
        DetailProfileCard(
            profilePic: nurse.profilePic == ''?
    'https://i.pinimg.com/564x/18/b5/b5/18b5b599bb873285bd4def283c0d3c09.jpg': nurse.profilePic,
            doctorName: nurse.name,
            licenseNumber: nurse.licenseNumber,
            specialis: nurse.specialityName),
        const ListJadwalCard(schedule: []),
      ],
    );
  }
}
