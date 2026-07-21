import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/utils/animated_snack_dialog.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/utils/app_validation.dart';
import 'package:motora/core/widgets/primary_button_widget.dart';
import 'package:motora/core/widgets/primary_text_field.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/auth/auth_services/auth_services.dart';
import 'package:motora/features/auth/login/widgets/google_and_apple_icons_widget.dart';
import 'package:motora/features/auth/sign/widgets/already_have_account_widget.dart';
import 'package:motora/features/auth/sign/widgets/or_register_with_email_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool isChecked = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (!isChecked) {
      showAnimatedSnackDialog(
        context,
        message: "Please accept the Terms & Conditions to continue.",
        type: AnimatedSnackBarType.warning,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _authService.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        fullName: _fullNameController.text.trim(),
      );
      if (!mounted) return;
      showAnimatedSnackDialog(
        context,
        message: "Account created successfully! Please sign in.",
        type: AnimatedSnackBarType.success,
      );
      context.pushReplacementNamed(AppRoutes.loginScreen);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      showAnimatedSnackDialog(
        context,
        message: AuthService.messageFromException(e),
        type: AnimatedSnackBarType.error,
      );
    } catch (_) {
      if (!mounted) return;
      showAnimatedSnackDialog(
        context,
        message: "Something went wrong. Please try again.",
        type: AnimatedSnackBarType.error,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Motora", style: context.primaryHeadLine),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,

            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(24),
                Center(
                  child: Text("Create Account", style: context.black32SemiBold),
                ),
                HeightSpace(8),
                Text(
                  "Join the community of procision-focused drivers",
                  style: context.suptitle,
                  textAlign: TextAlign.center,
                ),
                HeightSpace(30),
                GoogleAndAppleIconsWidget(),
                HeightSpace(24),
                OrRegisterWithEmailWidget(),
                HeightSpace(16),
                Text("Full Name", style: context.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  width: 358.w,
                  controller: _fullNameController,
                  validator: AppValidation.validateFullName,
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
                Text("Email Address", style: context.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  width: 358.w,
                  controller: _emailController,
                  validator: AppValidation.validateEmail,
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

                Text("Phone Number", style: context.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  width: 358.w,
                  controller: _phoneController,
                  validator: AppValidation.validatePhone,
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
                Text("Password", style: context.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  fillColor: Color(0xffFFFFFF),
                  width: 358.w,
                  controller: _passwordController,
                  validator: AppValidation.validatePassword,
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
                Text("Confirm Password", style: context.grey12Medium),
                HeightSpace(8),
                PrimaryTextField(
                  fillColor: Color(0xffFFFFFF),
                  width: 358.w,
                  controller: _confirmPasswordController,
                  validator: (v) => AppValidation.validateConfirmPassword(
                    v,
                    _passwordController.text,
                  ),
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
                          style: context.grey16W400.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.greyColor,
                          ),
                          children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: context.blue15W500Style,
                            ),

                            TextSpan(
                              text: " and ",
                              style: context.grey16W400.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.greyColor,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy.",
                              style: context.blue15W500Style,
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
                    buttonText: _isLoading
                        ? "Creating account..."
                        : "Create Account",
                    onPress: _isLoading ? null : _signUp,
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
