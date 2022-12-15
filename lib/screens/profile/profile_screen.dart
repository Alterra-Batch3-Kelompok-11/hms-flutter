import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_loading.dart';
import 'package:hospital_management_system/screens/profile/doctor_profile_screen.dart';
import 'package:hospital_management_system/screens/profile/nurse_profile_screen.dart';
import 'package:hospital_management_system/screens/profile/widgets/profile_loading.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/utils/helper_dialog.dart';
import 'package:hospital_management_system/view_model/auth_view_model/auth_bloc.dart';
import 'package:hospital_management_system/view_model/doctor_view_model/doctor_bloc.dart';

import '../../view_model/nurse_view_model/nurse_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

bool? isDoctor;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    print("INIT STATE");
    context.read<AuthBloc>().stream.listen((state) {
      print("STATE PROFILE : $state");
      if (state is AuthRoleId) {
        if (state.roleId == 2) {
          print("PROFILE LOADED");
          isDoctor = true;
        } else {
          isDoctor = false;
        }
      }
    });

    if (isDoctor == true) {
      print("GET PROFILE DOCTOR");
      context.read<DoctorBloc>().add(GetProfileDoctor());
    } else {
      print("GET PROFILE NURSE");
      context.read<NurseBloc>().add(GetProfileNurse());
    }
    super.initState();
  }

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
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Constant.horizontalPadding,
        ),
        child: (isDoctor != true)
            ? BlocBuilder<NurseBloc, NurseState>(
                buildWhen: (previous, current) {
                  return current is NurseProfileLoaded;
                },
                builder: (context, state) {
                  print(state);
                  if (state is NurseLoading) {
                    return const GlobalLoading(layout: DetailDoctorLoading());
                  } else if (state is NurseProfileLoaded) {
                    return NurseProfileScreen(nurse: state.nurse);
                  } else if (state is NurseError) {
                    print(state.message);
                    return const Center(
                      child: Text("Nurse Error"),
                    );
                  } else {
                    print("ELSE NURSE");
                    return const SizedBox.shrink();
                  }
                },
              )
            : BlocBuilder<DoctorBloc, DoctorState>(
                buildWhen: (previous, current) {
                  return current is ProfileDoctorLoaded;
                },
                builder: (context, state) {
                  if (state is LoadingDoctor) {
                    return const GlobalLoading(layout: DetailDoctorLoading());
                  } else if (state is ProfileDoctorLoaded) {
                    return DoctorProfileScreen(doctor: state.doctorModel);
                  } else {
                    print("ELSE DOCTOR");
                    return const SizedBox.shrink();
                  }
                },
              ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: Constant.horizontalPadding,
        ),
        child: GlobalButton(
            side: BorderSide(color: Constant.errorColor),
            color: Constant.whiteColor,
            onPressed: () => HelperDialog.confirmationDialog(context,
                titleText: "Keluar",
                subTitle: "Yakin keluar dari aplikasi ?",
                buttonSubmitChild: Text(
                  "Ya",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: 15,
                    color: Constant.whiteColor,
                    fontWeight: Constant.mediumFontWeight,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Constant.baseColor,
                icon: SvgPicture.asset(
                  "assets/icons/peringatan_icon.svg",
                  color: Constant.errorColor,
                ),
                onSubmit: () => Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.login, (route) => false),
                buttonCancelText: 'Batal'),
            buttonChild: Text(
              "Keluar",
              style: Constant.primaryTextStyle.copyWith(
                  fontSize: Constant.bodyFontSize,
                  fontWeight: Constant.semiBoldFontWeight,
                  color: Constant.errorColor),
            )),
      ),
    );
  }
}
