import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/utils/constant.dart';

import '../../view_model/auth_view_model/auth_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is IsLogout) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.login, (route) => false);
          }
        },
        child: Column(
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
                    backgroundImage:
                        AssetImage("assets/images/login_background.png"),
                  ),
                  const SizedBox(width: 20),
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constant.horizontalPadding,
              ),
              child: GlobalButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(Logout());
                  },
                  color: Constant.errorColor,
                  buttonChild: Text(
                    "Logout",
                    style: Constant.primaryTextStyle.copyWith(
                      fontWeight: Constant.semiBoldFontWeight,
                      color: Constant.backgroundColor,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
