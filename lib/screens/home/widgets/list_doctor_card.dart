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
      name: "name",
      specialityId: 1,
      licenseNumber: "licenseNumber",
      specialityName: "specialityName",
      doctorSchedules: [],
    )
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
              bool isSchedulesEmpty = doctors[index].doctorSchedules.isEmpty;
              String startTime = isSchedulesEmpty
                  ? ''
                  : doctors[index].doctorSchedules[index].startTime;
              String endTime = isSchedulesEmpty
                  ? ''
                  : doctors[index].doctorSchedules[index].endTime;
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"),
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
                              'Tersedia pukul $startTime - $endTime',
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
