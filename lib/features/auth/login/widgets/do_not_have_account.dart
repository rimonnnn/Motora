import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: context.suptitle),

        InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.signUpScreen);
          },
          child: Text(
            "Register",
            style: context.primaryHeadLine.copyWith(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
