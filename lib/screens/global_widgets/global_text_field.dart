import 'package:flutter/material.dart';
import 'package:hospital_management_system/utils/constant.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    Key? key,
    required this.fieldController,
    required this.hintText,
    required this.valueNotifier,
    required this.focusNode,
    this.maxLine,
    this.prefixIcon,
    this.obscureText = false,
    this.maxLength,
    required this.validator,
    this.onChange,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String hintText;
  final FocusNode focusNode;
  final int? maxLine;
  final int? maxLength;
  final ValueNotifier<bool> valueNotifier;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;

  updateFillColor() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        valueNotifier.value = true;
      } else {
        valueNotifier.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, bool onTap, child) {
        return TextFormField(
          textInputAction: TextInputAction.done,
          maxLength: maxLength,
          obscureText: obscureText,
          style: Constant.primaryTextStyle.copyWith(
              color: Constant.baseColor,
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.mediumFontWeight),
          cursorColor: Constant.baseColor,
          maxLines: maxLine,
          validator: validator,
          controller: fieldController,
          onTap: updateFillColor,
          onChanged: onChange,
          decoration: InputDecoration(
              filled: true,
              prefixIcon: (prefixIcon == null) ? null : Icon(prefixIcon),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Constant.baseColor, width: 2)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff89898B))),
              hintText: hintText,
              fillColor: valueNotifier.value == true
                  ? Constant.lightestColor
                  : Colors.white),
          focusNode: focusNode,
        );
      },
    );
  }
}
