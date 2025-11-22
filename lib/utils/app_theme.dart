import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarThemeData(
        iconTheme: IconThemeData(
            color: AppColors.blue
        ),
      ),
      scaffoldBackgroundColor: AppColors.darkBlue,
      primaryColor: AppColors.darkBlue,
      focusColor: AppColors.blue,
      cardColor: AppColors.darkBlue,
      secondaryHeaderColor: AppColors.offWhite,
      canvasColor: AppColors.darkBlue,
      disabledColor: AppColors.offWhite,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.offWhite20Bold,
          headlineMedium: AppTextStyles.offWhite16Medium,
        headlineSmall: AppTextStyles.offWhite14Bold,
        labelMedium: AppTextStyles.offWhite16Medium,
        labelSmall: AppTextStyles.darkBlue16Medium,
          titleSmall: AppTextStyles.darkBlue20bold
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkBlue,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
        selectedLabelStyle: AppTextStyles.white12Bold,
        unselectedLabelStyle: AppTextStyles.white12Bold,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.darkBlue,
          shape: StadiumBorder(
              side: BorderSide(
                  color: AppColors.white,
                  width: 6
              )
          )
      )
  );
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarThemeData(
        iconTheme: IconThemeData(
            color: AppColors.blue
        ),
      ),
    scaffoldBackgroundColor: AppColors.white,
      canvasColor: AppColors.offWhite,
      primaryColor: AppColors.blue,
      cardColor: AppColors.white,
      secondaryHeaderColor: AppColors.blue,
      focusColor: AppColors.offWhite,
      disabledColor: AppColors.black,
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.black20Bold,
        headlineMedium: AppTextStyles.blue16Medium,
      headlineSmall: AppTextStyles.black14Bold,
      labelMedium: AppTextStyles.black16Medium,
      labelSmall: AppTextStyles.offWhite16Medium,
        titleSmall: AppTextStyles.blue20Bold
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.blue,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
        selectedLabelStyle: AppTextStyles.white12Bold,
        unselectedLabelStyle: AppTextStyles.white12Bold,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.blue,
          shape: StadiumBorder(
              side: BorderSide(
                  color: AppColors.white,
                  width: 6
              )
          )
      )
  );
}