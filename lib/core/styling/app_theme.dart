import 'package:flutter/material.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/styling/app_fonts.dart';
import 'package:motora/core/styling/app_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFonts.appFonts,

    scaffoldBackgroundColor: AppColors.whiteColor,

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.blackColor,
      onSurfaceVariant: AppColors.greyColor,
      onPrimary: AppColors.whiteColor,
      error: AppColors.errorColor,
    ),

    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadLineStyle.copyWith(
        color: AppColors.primaryColor,
      ),
      titleMedium: AppStyles.suptitleStyle.copyWith(
        color: AppColors.secondaryColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFonts.appFonts,

    scaffoldBackgroundColor: AppColors.darkBackground,

    colorScheme: ColorScheme.dark(
      primary: AppColors.greyColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.darkSurface,
      onSurface: AppColors.whiteColor,
      onSurfaceVariant: AppColors.greyColor,
      onPrimary: AppColors.whiteColor,
      error: AppColors.errorColor,
    ),

    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadLineStyle.copyWith(
        color: AppColors.whiteColor,
      ),
      titleMedium: AppStyles.suptitleStyle.copyWith(color: AppColors.greyColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
    ),
  );
}
