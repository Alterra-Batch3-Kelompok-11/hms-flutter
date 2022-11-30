import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constant.lightColor,
        elevation: 0,
        title: Text(
          "Akun Saya",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(Constant.verticalPadding),
            margin: const EdgeInsets.symmetric(
              horizontal: Constant.horizontalPadding,
              vertical: Constant.verticalPadding,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: Constant.cardShadow,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Bones",
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.firstTitleSize,
                        fontWeight: Constant.boldFontWeight,
                      ),
                    ),
                    Text(
                      "0987265354674",
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: Constant.subtitleFontSize,
                        fontWeight: Constant.regularFontWeight,
                      ),
                    ),
                    Text('Spesialis :',
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.subtitleFontSize,
                          fontWeight: Constant.semiBoldFontWeight,
                        )),
                    Text('Jadwal :',
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: Constant.subtitleFontSize,
                          fontWeight: Constant.semiBoldFontWeight,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constant.horizontalPadding,
            ),
            child: Text(
              'Jadwal Saya',
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.subtitleFontSize,
                fontWeight: Constant.semiBoldFontWeight,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
