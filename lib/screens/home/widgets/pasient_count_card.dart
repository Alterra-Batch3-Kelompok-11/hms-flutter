import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/patient_queue_model.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientCountCard extends StatelessWidget {
  const PatientCountCard({Key? key, required this.patientQueueToday})
      : super(key: key);

  final PatientQueueToday? patientQueueToday;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Constant.veryLightColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${patientQueueToday!.totalQueueToday}",
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
                  color: Constant.veryLightColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${patientQueueToday!.totalFinishedToday}",
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
          const SizedBox(
            height: 15,
          ),
          (patientQueueToday!.patientsToday.isEmpty)
              ? const Center(child: Text("Tidak ada pasien hari ini"))
              : Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constant.horizontalPadding, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: Constant.cardBorderRadius,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: patientQueueToday!.patientsToday.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("Antrian",
                                  style: Constant.primaryTextStyle.copyWith(
                                    fontSize: Constant.captionFontSize,
                                    fontWeight: Constant.regularFontWeight,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                // padding: const EdgeInsets.all(10),
                                width: 42,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: Constant.cardBorderRadius,
                                  color: Constant.veryLightColor,
                                ),
                                child: Center(
                                    child: Text("${index + 1}",
                                        style: Constant.primaryTextStyle
                                            .copyWith(
                                                fontSize:
                                                    Constant.firstTitleSize,
                                                fontWeight:
                                                    Constant.semiBoldFontWeight,
                                                color: Constant.baseColor))),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama Pasien",
                                    style: Constant.primaryTextStyle.copyWith(
                                      fontSize: Constant.captionFontSize,
                                      fontWeight: Constant.regularFontWeight,
                                    ),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                    patientQueueToday!
                                        .patientsToday[index].name,
                                    style: Constant.primaryTextStyle.copyWith(
                                      fontSize: Constant.bodyFontSize,
                                      fontWeight: Constant.semiBoldFontWeight,
                                      color: Constant.baseColor,
                                    ),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Tanggal Kunjungan",
                                  style: Constant.primaryTextStyle.copyWith(
                                    fontSize: Constant.captionFontSize,
                                    fontWeight: Constant.regularFontWeight,
                                  ),
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  patientQueueToday!
                                      .patientsToday[index].scheduleDateIndo,
                                  style: Constant.primaryTextStyle.copyWith(
                                    fontSize: Constant.bodyFontSize,
                                    fontWeight: Constant.semiBoldFontWeight,
                                    color: Constant.baseColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
