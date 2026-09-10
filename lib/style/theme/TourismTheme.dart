import 'package:flutter/material.dart';
import 'package:tourism_app/constants/app_constants.dart';
import 'package:tourism_app/constants/tourism_color.dart';

class TourismTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: AppConstants.headingStyle,
      titleLarge: AppConstants.titleStyle,
      bodyLarge: AppConstants.bodyStyle,
      bodyMedium: AppConstants.mediumStyle,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: AppConstants.titleStyle,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: TourismColor.blue.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: TourismColor.blue.color,
      textTheme: _textTheme,
      brightness: Brightness.dark,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }
}
