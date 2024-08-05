import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        labelStyle: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          height: 2..h,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: AppColors.textColor),
        displayMedium: TextStyle(color: AppColors.textColor),
        displaySmall: TextStyle(color: AppColors.textColor),
        headlineLarge: TextStyle(color: AppColors.textColor),
        headlineMedium: TextStyle(color: AppColors.textColor),
        headlineSmall: TextStyle(color: AppColors.textColor),
        titleLarge: TextStyle(color: AppColors.textColor),
        titleMedium: TextStyle(color: AppColors.textColor),
        titleSmall: TextStyle(color: AppColors.textColor),
        bodyLarge: TextStyle(color: AppColors.textColor),
        bodyMedium: TextStyle(color: AppColors.textColor),
        bodySmall: TextStyle(color: AppColors.textColor),
        labelLarge: TextStyle(color: AppColors.textColor),
        labelMedium: TextStyle(color: AppColors.textColor),
        labelSmall: TextStyle(color: AppColors.textColor),
      ),
      fontFamily: 'Urbanist',
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.black),
        color: AppColors.white,
        foregroundColor: AppColors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
    );
  }
}
