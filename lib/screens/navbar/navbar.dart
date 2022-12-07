import 'package:flutter/material.dart';
import '../../utils/constant.dart';
import '../../screens/home/home_screen.dart';
import '../schedule/schedule_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/history/history_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  List pages = [
    HomeScreen(),
    const ScheduleScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, idx, _) {
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
                    icon: const SizedBox(
                        width: 65, height: 33, child: Icon(Icons.home)),
                    label: 'Beranda',
                    activeIcon: Container(
                      width: 65,
                      height: 33,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Constant.lightestColor,
                      ),
                      child: const Icon(Icons.home),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: const SizedBox(
                        width: 65,
                        height: 33,
                        child: Icon(Icons.calendar_today)),
                    label: 'Jadwal',
                    activeIcon: Container(
                      width: 65,
                      height: 33,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Constant.lightestColor,
                      ),
                      child: const Icon(Icons.calendar_today),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: const SizedBox(
                        width: 65, height: 33, child: Icon(Icons.access_time)),
                    label: 'Riwayat',
                    activeIcon: Container(
                      width: 65,
                      height: 33,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Constant.lightestColor,
                      ),
                      child: const Icon(Icons.access_time),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: const SizedBox(
                        width: 65, height: 33, child: Icon(Icons.person)),
                    label: 'Profil',
                    activeIcon: Container(
                      width: 65,
                      height: 33,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        color: Constant.lightestColor,
                      ),
                      child: const Icon(Icons.person),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
