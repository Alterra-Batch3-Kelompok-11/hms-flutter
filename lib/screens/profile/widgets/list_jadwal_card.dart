import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class ListJadwaCard extends StatefulWidget {
  const ListJadwaCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ListJadwaCard> createState() => _ListJadwaCardState();
}

class _ListJadwaCardState extends State<ListJadwaCard> {
  List jadwal = [
    {
      'tanggal': 'Senin, 1 Januari 2021',
      'jam': '10:00 - 11:00',
    },
    {
      'tanggal': 'Selasa, 2 Januari 2021',
      'jam': '10:00 - 11:00',
    },
    {
      'tanggal': 'Rabu, 3 Januari 2021',
      'jam': '10:00 - 11:00',
    },
    {
      'tanggal': 'Kamis, 4 Januari 2021',
      'jam': '10:00 - 11:00',
    },
  ];

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
                  child: Text('Januari 2021',
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
                  itemCount: jadwal.length,
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
                            jadwal[index]['tanggal'],
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
                                '${jadwal[index]['jam']} WIB',
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
