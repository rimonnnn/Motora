import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback? onPress;
  const SkipButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        'Skip',
        style: context.blue15W500Style.copyWith(fontSize: 15.sp),
      ),
    );
  }
}
