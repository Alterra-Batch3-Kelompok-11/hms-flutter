
import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/utils/constant.dart';

class ListDoctorCard extends StatelessWidget {
   ListDoctorCard({
    Key? key,
  }) : super(key: key);

 

  
  //list object doctor
  final List<DoctorModel> doctors = [
    DoctorModel(
      id: 1,
      name: 'Dr. M. A. Bari',
      photo: 'assets/images/profile.jpg',
      startTime: '10:00 AM',
      endTime: '11:00 AM',
    ),
    DoctorModel(
      id: 2,
      name: 'Dr. Roby',
      photo: 'assets/images/profile.jpg',
      startTime: '11:00 AM',
      endTime: '12:00 AM',
    ),
    DoctorModel(
      id: 3,
      name: 'Dr. charly',
      photo: 'assets/images/profile.jpg',
      startTime: '12:00 AM',
      endTime: '13:00 AM',
    ),
    DoctorModel(
      id: 4,
      name: 'Dr. Fauzy',
      photo: 'assets/images/profile.jpg',
      startTime: '13:00 AM',
      endTime: '14:00 AM',
    ),
    DoctorModel(
      id: 5,
      name: 'Dr. M. A. Bari',
      photo: 'assets/images/profile.jpg',
      startTime: '14:00 AM',
      endTime: '15:00 AM',
    ),
    DoctorModel(
      id: 6,
      name: 'Dr. M. A. Bari',
      photo: 'assets/images/profile.jpg',
      startTime: '15:00 AM',
      endTime: '16:00 AM',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Constant.horizontalPadding,
          vertical: Constant.verticalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: Constant.cardShadow,
      ),
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
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(doctors[index].photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctors[index].name,
                              style: Constant.primaryTextStyle.copyWith(
                                fontWeight: Constant.regularFontWeight,
                                fontSize: Constant.bodyFontSize,
                              ),
                            ),
                            Text(
                              'Tersedia pukul ${doctors[index].startTime} - ${doctors[index].endTime}',
                              style: Constant.primaryTextStyle.copyWith(
                                fontWeight: Constant.semiBoldFontWeight,
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
                //CAC4D0
                color: Color(0xFFCAC4D0),
                thickness: 1,
              );
            },
          ),
        ],
      ),
    );
  }
}
