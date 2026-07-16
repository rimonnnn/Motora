import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/styling/app_styles.dart';
import 'package:motora/core/widgets/primary_button_widget.dart';
import 'package:motora/core/widgets/primary_text_field.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/login_screen/widgets/google_and_apple_icons_widget.dart';
import 'package:motora/features/sign_up_screen/widgets/already_have_account_widget.dart';
import 'package:motora/features/sign_up_screen/widgets/or_register_with_email_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool isChecked = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
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

  String? _validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Full name is required";
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }
    final phoneRegex = RegExp(r'^(01)[0-9]{9}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return "Enter a valid phone number";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(24),
                Center(
                  child: Text(
                    "Create Account",
                    style: AppStyles.black32SemiBold,
                  ),
                ),
                HeightSpace(8),
                Text(
                  "Join the community of procision-focused drivers",
                  style: AppStyles.suptitleStyle,
                  textAlign: TextAlign.center,
                ),
                HeightSpace(30),
                GoogleAndAppleIconsWidget(),
                HeightSpace(24),
                OrRegisterWithEmailWidget(),
                HeightSpace(16),
                Text("Full Name", style: AppStyles.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  width: 358.w,
                  controller: _fullNameController,
                  validator: _validateFullName,
                  keyboardType: TextInputType.text,
                  hintText: "Enter your full name",
                  suffixIcon: Icon(
                    Icons.person_outline,
                    size: 24.sp,
                    color: AppColors.greyColor,
                  ),
                  fillColor: Color(0xffFFFFFF),
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
                HeightSpace(16),

                Text("Phone Number", style: AppStyles.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  width: 358.w,
                  controller: _phoneController,
                  validator: _validatePhone,
                  keyboardType: TextInputType.phone,
                  hintText: "01xxxxxxxxx",
                  suffixIcon: Icon(
                    Icons.phone_outlined,
                    size: 24.sp,
                    color: AppColors.greyColor,
                  ),
                  fillColor: Color(0xffFFFFFF),
                ),
                HeightSpace(16),
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
                HeightSpace(16),
                Text("Confirm Password", style: AppStyles.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  fillColor: Color(0xffFFFFFF),
                  width: 358.w,
                  controller: _confirmPasswordController,
                  validator: _validateConfirmPassword,
                  isPassword: _obscureConfirmPassword,
                  hintText: "••••••••",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 24.sp,
                      color: AppColors.greyColor,
                    ),
                    onPressed: () {
                      setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      );
                    },
                  ),
                ),
                HeightSpace(24),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) => setState(() => isChecked = value!),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "I agree to the ",
                          style: AppStyles.grey16W400.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.greyColor,
                          ),
                          children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: AppStyles.blue15W500Style,
                            ),

                            TextSpan(
                              text: " and ",
                              style: AppStyles.grey16W400.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.greyColor,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy.",
                              style: AppStyles.blue15W500Style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                HeightSpace(34),
                Center(
                  child: PrimaryButtonWidget(
                    textColor: AppColors.whiteColor,
                    fontSize: 18.sp,
                    buttonColor: AppColors.primaryColor,
                    buttonText: "Create Account",
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        // To do !!!!!!!!!!!!!
                        context.pushReplacementNamed(AppRoutes.loginScreen);
                      }
                    },
                  ),
                ),
                HeightSpace(24),

                AlreadyHaveAccountWidget(),
                HeightSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
