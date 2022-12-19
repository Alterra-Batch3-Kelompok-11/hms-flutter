import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constant.dart';
import '../../view_model/patient_view_model/patient_bloc.dart';
import 'widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    context.read<PatientBloc>().add(GetNotification());
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
          "Notifikasi",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, state) {
          if (state is NotificationLoaded) {
            if (state.notificationList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.notificationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: Constant.cardShadow,
                      ),
                      child: NotificationCard(
                        notification: state.notificationList[index],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 60,
                    right: 60,
                  ),
                  child: Text(
                    "Tidak ada notifikasi untuk saat ini",
                    style: Constant.primaryTextStyle.copyWith(
                      fontWeight: Constant.regularFontWeight,
                      fontSize: Constant.subtitleFontSize,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          } else if (state is PatientLoading) {
            return const SizedBox.shrink();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

// ignore: non_constant_identifier_names
  // Widget Buildnotif() {
  //   return
  // }
}
