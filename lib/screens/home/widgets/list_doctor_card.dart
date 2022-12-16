import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/utils/constant.dart';

class ListDoctorCard extends StatelessWidget {
  const ListDoctorCard({
    Key? key,
    required this.doctorList,
  }) : super(key: key);

  final List<DoctorModel> doctorList;

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
          (doctorList.isEmpty)
              ? Center(
                  child: Text(
                    "Tidak ada jadwal",
                    style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.secondTitleFontSize,
                        fontWeight: Constant.mediumFontWeight),
                  ),
                )
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: doctorList.length,
                  itemBuilder: (context, index) {
                    print("doctorList.length ${doctorList.length}");
                    print("DOCTOR LIST : ${doctorList[index].name}");
                    String profilePic = doctorList[index].profilePic == ''
                        ? 'https://i.pinimg.com/564x/18/b5/b5/18b5b599bb873285bd4def283c0d3c09.jpg'
                        : doctorList[index].profilePic;
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
                                    image: NetworkImage(profilePic),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctorList[index].name,
                                    style: Constant.primaryTextStyle.copyWith(
                                      fontWeight: Constant.regularFontWeight,
                                      fontSize: Constant.bodyFontSize,
                                    ),
                                  ),
                                  Text(
                                    'Tersedia pukul ${doctorList[index].doctorSchedules[0].startTime} - ${doctorList[index].doctorSchedules[0].endTime}',
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
