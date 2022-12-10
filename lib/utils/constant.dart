import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 24.0;

  static const Color whiteColor = Color(0xffffffff);
  static const Color backgroundColor = Color(0xffF3F3F3);
  static const Color veryLightColor = Color(0xffEBF2F9);
  static const Color lightestColor = Color(0xffCCE3F2);
  static const Color lighterColor = Color(0xffAAD0E9);
  static const Color lightColor = Color(0xff55A0D2);
  static const Color baseColor = Color(0xff0071BC);
  static const Color darkColor = Color(0xff005E9D);
  static const Color darker = Color(0xff00395E);
  static const Color darkest = Color(0xff001726);

  static Color successColor = const Color(0xff70BE03);
  static Color errorColor = const Color(0xffB3261E);

  static TextStyle primaryTextStyle = GoogleFonts.poppins(color: darker);
  static TextStyle secondaryTextStyle = GoogleFonts.poppins(color: baseColor);

  static const double firstTitleSize = 18.0;
  static const double secondTitleFontSize = 16.0;
  static const double subtitleFontSize = 14.0;
  static const double bodyFontSize = 12.0;
  static const double captionFontSize = 10.0;

  static const FontWeight boldFontWeight = FontWeight.w700;
  static const FontWeight semiBoldFontWeight = FontWeight.w600;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight regularFontWeight = FontWeight.w400;

  static const List<BoxShadow> cardShadow = [
    BoxShadow(
        color: Colors.black26,
        blurRadius: 1.5,
        spreadRadius: 0.5,
        offset: Offset(0, 1))
  ];

  static BorderRadius cardBorderRadius = BorderRadius.circular(12);
}
