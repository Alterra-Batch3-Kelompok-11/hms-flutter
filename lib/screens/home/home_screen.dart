import 'package:flutter/material.dart';
import '../../utils/constant.dart';
import '../../models/doctor_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //list object doctor
  final List<DoctorModel> doctors = [
    DoctorModel(
      id: 1,
      name: 'Dr. M. A. Bari',
      startTime: '10:00 AM',
      endTime: '11:00 AM',
    ),
    DoctorModel(
      id: 2,
      name: 'Dr. Roby',
      startTime: '11:00 AM',
      endTime: '12:00 AM',
    ),
    DoctorModel(
      id: 3,
      name: 'Dr. charly',
      startTime: '12:00 AM',
      endTime: '13:00 AM',
    ),
    DoctorModel(
      id: 4,
      name: 'Dr. Fauzy',
      startTime: '13:00 AM',
      endTime: '14:00 AM',
    ),
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
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
          leading: Transform.translate(
            offset: const Offset(15, 0),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/login_background.png'),
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
                                      'Tersedia pukul ${doctors[index].startTime} - ${doctors[index].endTime}',
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
