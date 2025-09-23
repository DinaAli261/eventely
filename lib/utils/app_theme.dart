import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkBlue,
      appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.blue,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.offWhite20Bold,
      )
  );
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.blue,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.black20Bold,
    ),
  );
}