import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ", style: context.suptitle),

        InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
          },
          child: Text(
            "Login",
            style: context.primaryHeadLine.copyWith(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
