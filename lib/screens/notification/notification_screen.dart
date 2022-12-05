import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constant.dart';

class NotficationScreen extends StatelessWidget {
  const NotficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constant.lightColor,
        elevation: 0,
        title: Text(
          "Notifikasi",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: Buildnotif(),
    );
  }

// ignore: non_constant_identifier_names
  Widget Buildnotif() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: Constant.cardShadow,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red),
                      ),
                    ],
                  ),
                  title: Text(
                    "Pemeliharaan Sistem",
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                  trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "18-11-2022",
                          style: Constant.primaryTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: Constant.semiBoldFontWeight,
                          ),
                        ),
                        Text(
                          "12.00 - 12.30",
                          style: Constant.primaryTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: Constant.semiBoldFontWeight,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        );
      },

      //   Card(shape: ,
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         ListTile(
      //           leading: Icon(Icons.adjust),
      //           title: Text("Pemeliharaan Sistem"),
      //           trailing: Column(children: [
      //             Text("18-11-2022"),
      //             Text("12.00 - 12.30"),
      //           ]),
      //         ),
      //       ],
      //     ),
      //   ),
      //   SizedBox(
      //     width: Constant.horizontalPadding,
      //   ),

      // ],
    );
  }
}
