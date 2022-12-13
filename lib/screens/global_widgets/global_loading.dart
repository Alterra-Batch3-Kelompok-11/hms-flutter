import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({Key? key, required this.layout}) : super(key: key);

  final Widget layout;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children: [
        Shimmer.fromColors(
          child: layout,
          baseColor: Colors.grey.withOpacity(0.1),
          highlightColor: Constant.backgroundColor,
        )
      ],
    );
  }
}
