import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {Key? key,
      required this.onPressed,
      required this.buttonChild,
      this.color,
      this.side = BorderSide.none,
      this.fixedWidth = 0})
      : super(key: key);

  final void Function() onPressed;
  final Widget buttonChild;
  final double fixedWidth;
  final BorderSide? side;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: (color == null) ? Constant.baseColor : color,
          fixedSize: Size(fixedWidth == 0 ? double.maxFinite : fixedWidth, 41),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          foregroundColor: Constant.backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100), side: side!)),
      onPressed: onPressed,
      child: buttonChild,
    );
  }
}
