import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndecator extends StatelessWidget {
  final PageController controller;
  final int count;
  const PageIndecator({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,

      count: count,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.primaryColor,
        dotWidth: 10.w,
        dotHeight: 10.h,
      ),
    );
  }
}
