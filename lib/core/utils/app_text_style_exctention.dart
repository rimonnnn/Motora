// app_text_styles_extension.dart
import 'package:flutter/material.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/styling/app_styles.dart';

extension AppTextStyles on BuildContext {
  ColorScheme get _colors => Theme.of(this).colorScheme;

  TextStyle get primaryHeadLine =>
      AppStyles.primaryHeadLineStyle.copyWith(color: AppColors.primaryColor);

  TextStyle get suptitle =>
      AppStyles.suptitleStyle.copyWith(color: AppColors.secondaryColor);

  TextStyle get grey16W400 =>
      AppStyles.grey16W400.copyWith(color: _colors.onSurfaceVariant);

  TextStyle get black32SemiBold =>
      AppStyles.black32SemiBold.copyWith(color: _colors.onSurface);

  TextStyle get grey12Medium =>
      AppStyles.grey12Medium.copyWith(color: _colors.onSurfaceVariant);

  TextStyle get white15W500 =>
      AppStyles.white15W500.copyWith(color: AppColors.whiteColor);

  TextStyle get black16SemiBold =>
      AppStyles.black16SemiBold.copyWith(color: _colors.onSurface);

  TextStyle get blue15W500Style =>
      AppStyles.blue15W500Style.copyWith(color: AppColors.primaryColor);
}