import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/utils/helper_dialog.dart';
import 'package:hospital_management_system/view_model/auth_view_model/auth_bloc.dart';
import 'package:hospital_management_system/view_model/user_view_model/user_bloc.dart';
import '../../utils/constant.dart';
import '../../screens/home/home_screen.dart';
import '../schedule/schedule_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/history/history_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key, this.selectedIndex}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();

  final int? selectedIndex;
}

class _NavbarScreenState extends State<NavbarScreen> {
  List pages = [];

  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  AuthModel? dataUser;

  @override
  void initState() {
    super.initState();

    currentIndex.value = widget.selectedIndex ?? 0;

    context.read<UserBloc>().add(GetDataUser());

    context.read<AuthBloc>().stream.listen((state) {
      if (state is AuthExpiredToken) {
        HelperDialog.alertDialog(context,
            titleText: "Peringatan",
            buttonSubmitText: "Login",
            icon: const Icon(Icons.login),
            onSubmit: () => Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.login, (route) => false));
      }
    });
    pages.addAll([
      BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is DataUserLoaded) {
            return HomeScreen(dataUser: state.dataUser);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is DataUserLoaded) {
            return ScheduleScreen(
              dataUser: state.dataUser,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      const HistoryScreen(),
      BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          print("NAVBAR STATE : $state");
          if (state is DataUserLoaded) {
            print(state.dataUser.name);
            return ProfileScreen(dataUser: state.dataUser);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, int idx, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: pages[currentIndex.value],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: BottomNavigationBar(
                landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  currentIndex.value = index;
                },
                currentIndex: currentIndex.value,
                selectedItemColor: Constant.darker,
                unselectedItemColor: Colors.grey,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 20, height: 25,
                      //icon from svg
                      child: SvgPicture.asset(
                        'assets/icons/home_icon.svg',
                        color: Colors.grey,
                      ),
                      // child: Icon(Icons.home),
                    ),
                    label: 'Beranda',
                    activeIcon: Container(
                      padding: const EdgeInsets.all(5),
                      width: 65,
                      height: 33,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Constant.lightestColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/home_icon_tap.svg',
                        color: Constant.darker,
                        // height: 5,
                        // width: 5,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 20, height: 25,
                      //icon from svg
                      child: SvgPicture.asset(
                        'assets/icons/jadwal_icon.svg',
                        color: Colors.grey,
                      ),
                    ),
                    label: 'Jadwal',
                    activeIcon: Container(
                      padding: const EdgeInsets.all(5),
                      width: 65,
                      height: 33,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Constant.lightestColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/jadwal_icon_tap.svg',
                        color: Constant.darker,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 20,
                      height: 25,
                      child: SvgPicture.asset(
                        'assets/icons/riwayat_icon.svg',
                        color: Colors.grey,
                      ),
                    ),
                    label: 'Riwayat',
                    activeIcon: Container(
                        padding: const EdgeInsets.all(5),
                        width: 65,
                        height: 33,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                          color: Constant.lightestColor,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/riwayat_icon_tap.svg',
                          color: Constant.darker,
                        )),
                  ),
                  BottomNavigationBarItem(
                    icon: const SizedBox(
                        width: 69,
                        height: 35,
                        child: Icon(Icons.person_outline)),
                    label: 'Profil',
                    activeIcon: Container(
                      padding: const EdgeInsets.all(5),
                      width: 65,
                      height: 33,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Constant.lightestColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/profile_icon_tap.svg',
                        color: Constant.darker,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
