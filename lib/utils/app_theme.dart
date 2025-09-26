import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkBlue,
      appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.blue,
          toolbarHeight: 156,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(64),
              )
          )
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.offWhite20Bold,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkBlue,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
        selectedLabelStyle: AppTextStyles.White12Bold,
        unselectedLabelStyle: AppTextStyles.White12Bold,
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
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarThemeData(
        toolbarHeight: 156,
      backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(64),
            )
        )
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.black20Bold,
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.blue,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
        selectedLabelStyle: AppTextStyles.White12Bold,
        unselectedLabelStyle: AppTextStyles.White12Bold,
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