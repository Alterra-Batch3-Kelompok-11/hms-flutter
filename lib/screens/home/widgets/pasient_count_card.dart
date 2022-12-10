import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class PatientCountCard extends StatelessWidget {
  const PatientCountCard({
    Key? key,
  }) : super(key: key);

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
                  color: Constant.veryLightColor,
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
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Constant.horizontalPadding, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: Constant.cardBorderRadius,
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("Antrian",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.secondTitleFontSize,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 60,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: Constant.cardBorderRadius,
                        color: Constant.veryLightColor,
                      ),
                      child: Center(
                          child: Text("1",
                              style: Constant.primaryTextStyle.copyWith(
                                fontSize: Constant.firstTitleSize,
                                fontWeight: Constant.semiBoldFontWeight,
                              ))),
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
                            fontSize: Constant.subtitleFontSize,
                            fontWeight: Constant.mediumFontWeight,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text("Joni",
                          style: Constant.primaryTextStyle.copyWith(
                            fontSize: Constant.subtitleFontSize,
                            fontWeight: Constant.semiBoldFontWeight,
                            color: Constant.baseColor,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text(
                        "Tanggal Kunjungan",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.subtitleFontSize,
                          fontWeight: Constant.mediumFontWeight,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "18 September 2022 10:00",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.subtitleFontSize,
                          fontWeight: Constant.semiBoldFontWeight,
                          color: Constant.baseColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Constant.horizontalPadding, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: Constant.cardBorderRadius,
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("Antrian",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.secondTitleFontSize,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 60,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: Constant.cardBorderRadius,
                        color: Constant.veryLightColor,
                      ),
                      child: Center(
                          child: Text("2",
                              style: Constant.primaryTextStyle.copyWith(
                                fontSize: Constant.firstTitleSize,
                                fontWeight: Constant.semiBoldFontWeight,
                              ))),
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
                            fontSize: Constant.subtitleFontSize,
                            fontWeight: Constant.mediumFontWeight,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text("Joni",
                          style: Constant.primaryTextStyle.copyWith(
                            fontSize: Constant.subtitleFontSize,
                            fontWeight: Constant.semiBoldFontWeight,
                            color: Constant.baseColor,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text(
                        "Tanggal Kunjungan",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.subtitleFontSize,
                          fontWeight: Constant.mediumFontWeight,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "18 September 2022 10:00",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.subtitleFontSize,
                          fontWeight: Constant.semiBoldFontWeight,
                          color: Constant.baseColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
