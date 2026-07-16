import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/styling/app_styles.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: AppStyles.suptitleStyle),

        InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.signUpScreen);
          },
          child: Text(
            "Register",
            style: AppStyles.primaryHeadLineStyle.copyWith(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
