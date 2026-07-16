import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/styling/app_styles.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';

class OrRegisterWithEmailWidget extends StatelessWidget {
  const OrRegisterWithEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        children: [
          Expanded(child: Divider(color: AppColors.greyColor)),
          WidthSpace(8),
          Text("Or Register with email", style: AppStyles.grey16W400),
          WidthSpace(8),
          Expanded(child: Divider(color: AppColors.greyColor)),
        ],
      ),
    );
  }
}
