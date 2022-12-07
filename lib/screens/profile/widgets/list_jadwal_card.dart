import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/schedule_model.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:intl/intl.dart';

class ListJadwalCard extends StatelessWidget {
  const ListJadwalCard({Key? key, required this.schedule}) : super(key: key);

  final List<ScheduleModel> schedule;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jadwal Saya',
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.semiBoldFontWeight,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: Constant.verticalPadding),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: Constant.cardShadow,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: Constant.horizontalPadding,
                  ),
                  decoration: const BoxDecoration(
                    color: Constant.lightColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                  child: Text(
                      'Jadwal ' +
                          schedule[0].createdAt!.split('-')[0].toString(),
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.subtitleFontSize,
                        fontWeight: Constant.boldFontWeight,
                        color: Constant.whiteColor,
                      ),
                      textAlign: TextAlign.center),
                ),
                //
                //Body
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: schedule.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constant.horizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            schedule[index].dayString +
                                ' | ' +
                                DateFormat('MMM d, yyyy').format(
                                    DateTime.parse(schedule[index].createdAt!)),
                            style: Constant.primaryTextStyle.copyWith(
                              fontSize: Constant.subtitleFontSize,
                              fontWeight: Constant.semiBoldFontWeight,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Constant.lightColor,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${schedule[index].startTime} - ${schedule[index].endTime} WIB',
                                style: Constant.secondaryTextStyle.copyWith(
                                  fontSize: Constant.bodyFontSize,
                                  fontWeight: Constant.mediumFontWeight,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Divider(
                            //D9D9D9
                            color: Color(0xffD9D9D9),
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
