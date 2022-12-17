import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/models/auth_model.dart';
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
  const ProfileScreen({Key? key, this.dataUser}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  final AuthModel? dataUser;
}

bool? isDoctor;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    context.read<NurseBloc>().add(GetProfileNurse());
    context.read<DoctorBloc>().add(GetProfileDoctor());
    print("INIT STATE");
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
        child: (widget.dataUser!.doctorId == 0)
            ? BlocBuilder<NurseBloc, NurseState>(
                buildWhen: (previous, current) {
                  return current is ProfileNurseLoaded;
                },
                builder: (context, state) {
                  print(state);
                  if (state is NurseLoading) {
                    return const GlobalLoading(layout: DetailDoctorLoading());
                  } else if (state is ProfileNurseLoaded) {
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
                    return const GlobalLoading(layout: DetailDoctorLoading());
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
                buttonSubmitChild: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const SizedBox(
                        height: 20,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Constant.whiteColor,
                          strokeWidth: 2,
                        ),
                      );
                    } else {
                      return Text(
                        "Ya",
                        style: Constant.primaryTextStyle.copyWith(
                          fontSize: 15,
                          color: Constant.whiteColor,
                          fontWeight: Constant.mediumFontWeight,
                        ),
                        textAlign: TextAlign.center,
                      );
                    }
                  },
                ),
                color: Constant.baseColor,
                icon: SvgPicture.asset(
                  "assets/icons/peringatan_icon.svg",
                  color: Constant.errorColor,
                ),
                onSubmit: () {
                  context.read<AuthBloc>().add(Logout());
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.login, (route) => false);
                },
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
