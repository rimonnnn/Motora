import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/onboarding_screen/models/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          HeightSpace(16),
          Container(
            width: 365.w,
            height: 447.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Image.asset(item.image, fit: BoxFit.fill),
          ),
          HeightSpace(16),
          Text(item.title, style: context.black16SemiBold),
          HeightSpace(16),
          Text(
            item.description,
            style: context.grey12Medium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
