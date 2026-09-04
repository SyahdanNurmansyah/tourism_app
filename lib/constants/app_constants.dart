import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  AppConstants._(); // Biar ga bisa di-instance
  static const Color primaryColor = Color(0xFF005BB1);
  static const Color secondaryColor = Color(0xFF1A1A1A);
  static const Color textColor = Color(0XFF1A1A1A);
  static const Color textGreyColor = Color(0xFFF5F5F5);

  static TextStyle get headingStyle => GoogleFonts.googleSans(
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: primaryColor,
    height: 1.2,
  );

  static TextStyle get titleStyle => GoogleFonts.googleSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static TextStyle get mediumStyle =>
      GoogleFonts.inter(fontSize: 16, color: textColor);

  static TextStyle get bodyStyle =>
      GoogleFonts.inter(fontSize: 14, color: textColor);

  // PADDING
  static const double largePadding = 24.0;
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;

  // BORDER RADIUS
  static const double largeBorderRadius = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
}
