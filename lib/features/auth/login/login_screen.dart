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
import 'package:motora/features/auth/auth_services/auth_services.dart';
import 'package:motora/core/widgets/primary_button_widget.dart';
import 'package:motora/core/widgets/primary_text_field.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/auth/login/widgets/do_not_have_account.dart';
import 'package:motora/features/auth/login/widgets/google_and_apple_icons_widget.dart';
import 'package:motora/features/auth/login/widgets/or_continue_with_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isChecked = false;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await _authService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      showAnimatedSnackDialog(
        context,
        message: "Welcome back!",
        type: AnimatedSnackBarType.success,
      );
      context.pushReplacementNamed(AppRoutes.mainScreen);
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
            // autovalidateMode بيخلي الأخطاء تختفي أول ما المستخدم يصحح الحقل
            // بدل ما تفضل ظاهرة لحد ما يضغط submit تاني
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(24),
                Center(
                  child: Text("Welcome back", style: context.black32SemiBold),
                ),
                HeightSpace(8),
                Text(
                  "Log in to manage your luxury fleet and track your latest acquistions",
                  style: context.suptitle,
                  textAlign: TextAlign.center,
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
                HeightSpace(24),
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
                          style: context.grey16W400.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Text("Forgot password?", style: context.blue15W500Style),
                  ],
                ),
                HeightSpace(34),
                Center(
                  child: PrimaryButtonWidget(
                    textColor: AppColors.whiteColor,
                    fontSize: 18.sp,
                    buttonColor: AppColors.primaryColor,
                    buttonText: _isLoading ? "Signing in..." : "Sign in",
                    onPress: _isLoading ? null : _login,
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
