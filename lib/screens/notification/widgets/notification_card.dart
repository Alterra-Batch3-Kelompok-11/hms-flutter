import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/notification_model.dart';
import 'package:hospital_management_system/utils/constant.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Constant.baseColor),
          ),
        ],
      ),
      title: Text(
        notification.description,
        style: Constant.primaryTextStyle.copyWith(
          fontSize: 12,
          fontWeight: Constant.semiBoldFontWeight,
        ),
      ),
      trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          notification.scheduleDateIndo,
          style: Constant.primaryTextStyle.copyWith(
            fontSize: 10,
            fontWeight: Constant.semiBoldFontWeight,
          ),
        ),
        Text(
          notification.scheduleTime,
          style: Constant.primaryTextStyle.copyWith(
            fontSize: 10,
            fontWeight: Constant.semiBoldFontWeight,
          ),
        ),
      ]),
    );
  }
}
