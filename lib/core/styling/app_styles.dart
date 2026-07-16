import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/styling/app_fonts.dart';

class AppStyles {
  static TextStyle primaryHeadLineStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 30.sp,
    fontFamily: AppFonts.appFonts,
    fontWeight: FontWeight.bold,
  );
  static TextStyle suptitleStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 16.sp,
    fontFamily: AppFonts.appFonts,
    fontWeight: FontWeight.w500,
  );
  static TextStyle grey16W400 = TextStyle(
    fontFamily: AppFonts.appFonts,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xff808080),
  );
  static TextStyle black32SemiBold = TextStyle(
    fontFamily: AppFonts.appFonts,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static TextStyle grey12Medium = TextStyle(
    fontFamily: AppFonts.appFonts,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
  );
  static TextStyle white15W500 = TextStyle(
    fontFamily: AppFonts.appFonts,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle black16SemiBold = TextStyle(
    fontFamily: AppFonts.appFonts,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static TextStyle blue15W500Style = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 15.sp,
    fontFamily: AppFonts.appFonts,
    fontWeight: FontWeight.w500,
  );
}
