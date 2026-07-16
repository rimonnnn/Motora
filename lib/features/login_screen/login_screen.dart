import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/styling/app_styles.dart';
import 'package:motora/core/widgets/primary_button_widget.dart';
import 'package:motora/core/widgets/primary_text_field.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/login_screen/widgets/do_not_have_account.dart';
import 'package:motora/features/login_screen/widgets/google_and_apple_icons_widget.dart';
import 'package:motora/features/login_screen/widgets/or_continue_with_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isChecked = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text("Motora", style: AppStyles.primaryHeadLineStyle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            // autovalidateMode بيخلي الأخطاء تختفي أول ما المستخدم يصحح الحقل
            // بدل ما تفضل ظاهرة لحد ما يضغط submit تاني
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(24),
                Center(
                  child: Text("Welcome back", style: AppStyles.black32SemiBold),
                ),
                HeightSpace(8),
                Text(
                  "Log in to manage your luxury fleet and track your latest acquistions",
                  style: AppStyles.suptitleStyle,
                  textAlign: TextAlign.center,
                ),
                HeightSpace(16),
                Text("Email Address", style: AppStyles.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  width: 358.w,
                  controller: _emailController,
                  validator: _validateEmail,
                  keyboardType:
                      TextInputType.emailAddress, // <-- دلوقتي شغال بعد التعديل
                  hintText: "name@company.com",
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    size: 24.sp,
                    color: AppColors.greyColor,
                  ),
                  fillColor: Color(0xffFFFFFF),
                ),
                HeightSpace(24),
                Text("Password", style: AppStyles.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  fillColor: Color(0xffFFFFFF),
                  width: 358.w,
                  controller: _passwordController,
                  validator: _validatePassword,
                  isPassword: _obscurePassword, // <-- بدل obscureText
                  hintText: "••••••••",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 24.sp,
                      color: AppColors.greyColor,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
                HeightSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) =>
                              setState(() => isChecked = value!),
                        ),
                        WidthSpace(2),
                        Text(
                          "Remember me",
                          style: AppStyles.grey16W400.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Text("Forgot password?", style: AppStyles.blue15W500Style),
                  ],
                ),
                HeightSpace(34),
                Center(
                  child: PrimaryButtonWidget(
                    textColor: AppColors.whiteColor,
                    fontSize: 18.sp,
                    buttonColor: AppColors.primaryColor,
                    buttonText: "Sign in",
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        // To do !!!!!!!!!!!!!
                        context.pushReplacementNamed(AppRoutes.mainScreen);
                      }
                    },
                  ),
                ),
                HeightSpace(34),
                OrContinueWithWidget(),
                HeightSpace(24),
                GoogleAndAppleIconsWidget(),
                HeightSpace(40),
                DoNotHaveAccount(),
                HeightSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
