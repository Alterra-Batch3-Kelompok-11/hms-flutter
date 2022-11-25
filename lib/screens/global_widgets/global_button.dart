import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {Key? key,
      required this.onPressed,
      required this.buttonTitle,
      this.fixedWidth = 0})
      : super(key: key);

  final void Function() onPressed;
  final String buttonTitle;
  final double fixedWidth;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Constant.baseColor,
          fixedSize: Size(fixedWidth == 0 ? double.maxFinite : fixedWidth, 41),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: Constant.primaryTextStyle.copyWith(
          fontSize: Constant.subtitleFontSize,
          fontWeight: Constant.semiBoldFontWeight,
          color: Colors.white,
        ),
      ),
    );
  }
}
