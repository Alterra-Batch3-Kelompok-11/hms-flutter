import 'package:flutter/material.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import '../../utils/constant.dart';
import '../../models/doctor_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //list object doctor
  final List<DoctorModel> doctors = [
    DoctorModel(
        id: 1,
        name: "name",
        specialityId: 1,
        licenseNumber: "licenseNumber",
        specialityName: "specialityName",
        doctorSchedules: []),
  ];

  // list data doctor

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: Constant.cardShadow,
              ),
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pasien Hari Ini',
                    style: Constant.primaryTextStyle.copyWith(
                      fontWeight: Constant.boldFontWeight,
                      fontSize: Constant.subtitleFontSize,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 88,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Constant.lightestColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '8',
                              style: Constant.primaryTextStyle.copyWith(
                                fontWeight: Constant.boldFontWeight,
                                fontSize: 28,
                              ),
                            ),
                            Text(
                              'Antrian',
                              style: Constant.primaryTextStyle.copyWith(
                                fontWeight: Constant.boldFontWeight,
                                fontSize: Constant.bodyFontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 88,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Constant.lightestColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '12',
                              style: Constant.primaryTextStyle.copyWith(
                                fontWeight: Constant.boldFontWeight,
                                fontSize: 28,
                              ),
                            ),
                            Text(
                              'Telah Berkunjung',
                              style: Constant.primaryTextStyle.copyWith(
                                fontWeight: Constant.boldFontWeight,
                                fontSize: Constant.bodyFontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: Constant.cardShadow,
              ),
              margin: const EdgeInsets.only(top: 1),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dokter Tersedia',
                    style: Constant.primaryTextStyle.copyWith(
                      fontWeight: Constant.boldFontWeight,
                      fontSize: Constant.subtitleFontSize,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/login_background.png'),
                                  radius: 20,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctors[index].name,
                                      style: Constant.primaryTextStyle.copyWith(
                                        fontWeight: Constant.mediumFontWeight,
                                        fontSize: Constant.bodyFontSize,
                                      ),
                                    ),
                                    Text(
                                      (doctors[index].doctorSchedules.isEmpty)
                                          ? ''
                                          : 'Tersedia pukul ${doctors[index].doctorSchedules[index].startTime} - ${doctors[index].doctorSchedules[index].endTime}',
                                      style: Constant.primaryTextStyle.copyWith(
                                        fontWeight: Constant.boldFontWeight,
                                        fontSize: Constant.bodyFontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Constant.darkColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
