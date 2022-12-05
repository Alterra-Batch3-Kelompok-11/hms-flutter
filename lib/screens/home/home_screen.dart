import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/home/widgets/list_doctor_card.dart';
import 'package:hospital_management_system/screens/home/widgets/pasient_count_card.dart';
import '../../utils/constant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<DoctorModel> doctors = [
    DoctorModel(
      id: 1,
      name: 'Dr. M. A. Bari',
      startTime: '10:00 AM',
      endTime: '11:00 AM',
      photo: '',
    ),
    DoctorModel(
      id: 2,
      name: 'Dr. Roby',
      startTime: '11:00 AM',
      endTime: '12:00 AM',
      photo: '',
    ),
    DoctorModel(
      id: 3,
      name: 'Dr. charly',
      startTime: '12:00 AM',
      endTime: '13:00 AM',
      photo: '',
    ),
    DoctorModel(
      id: 4,
      name: 'Dr. Fauzy',
      startTime: '13:00 AM',
      endTime: '14:00 AM',
      photo: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95),
        child: AppBar(
          backgroundColor: Constant.lightColor,
          toolbarHeight: 90,
          leading: Transform.translate(
            offset: const Offset(15, 0),
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
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
                  'Dr. Bones',
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
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.notification);
              },
              icon: const Icon(Icons.notifications),
            ),
          ],

          leadingWidth: 50,

          //image profile
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: Constant.horizontalPadding),
        child: ListView(
          children: [
            //padding top
            const SizedBox(
              height: Constant.verticalPadding,
            ),
            const PasienCountCard(),
            const SizedBox(height: 20),

            ListDoctorCard(),

            // padding bottom
            const SizedBox(height: Constant.verticalPadding),
          ],
        ),
      ),
    );
  }
}
