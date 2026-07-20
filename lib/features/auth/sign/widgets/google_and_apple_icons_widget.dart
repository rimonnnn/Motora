import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/styling/app_assets.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';

class GoogleAndAppleIconsWidget extends StatelessWidget {
  const GoogleAndAppleIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 57.sp,
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: AppColors.greyColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.googleIcon, width: 24.w, height: 24.h),
                WidthSpace(8),
                Text("Google", style: context.black16SemiBold),
              ],
            ),
          ),
        ),
        WidthSpace(8),
        Expanded(
          child: Container(
            height: 57.sp,
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: AppColors.greyColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apple, color: colors.onSurface, size: 24.sp),
                WidthSpace(8),
                Text("Apple", style: context.black16SemiBold),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
