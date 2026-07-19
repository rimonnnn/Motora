import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/styling/app_styles.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback? onPress;
  const SkipButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        'Skip',
        style: AppStyles.blue15W500Style.copyWith(fontSize: 15.sp),
      ),
    );
  }
}
