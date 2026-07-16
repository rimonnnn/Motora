import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/styling/app_assets.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/splash_screen/widgets/splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // الـ controller الرئيسي بتاع animation الدخول (logo, title, tagline)
  late final AnimationController _controller;

  // controller منفصل بيتكرر باستمرار للـ pulse بتاع اللوجو
  late final AnimationController _pulseController;

  late final Animation<double> _scaleAnimation;
  late final Animation<double> _logoFadeAnimation;

  late final Animation<double> _titleFadeAnimation;
  late final Animation<Offset> _titleSlideAnimation;

  late final Animation<double> _taglineFadeAnimation;
  late final Animation<Offset> _taglineSlideAnimation;

  late final Animation<double> _backgroundAnimation;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // الخلفية: بتتدرج من لون فاتح جدًا للأبيض النهائي مع أول ٤٠٪ من الحركة
    _backgroundAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutBack),
      ),
    );

    _logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35, curve: Curves.easeOut),
      ),
    );

    _titleFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.65, curve: Curves.easeOut),
      ),
    );

    _titleSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.35, 0.65, curve: Curves.easeOutCubic),
          ),
        );

    _taglineFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );

    _taglineSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.6, 0.9, curve: Curves.easeOutCubic),
          ),
        );

    // نطاق الـ pulse بسيط جدًا (1.0 لـ 1.05) عشان يبقى subtle مش ملحوظ بشكل مبالغ فيه
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // نبدأ الـ pulse بس لما animation الدخول تخلص تمامًا
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.repeat(reverse: true);
      }
    });

    _controller.forward();

    waitAnimationAndNavigate();
  }

  Future<void> waitAnimationAndNavigate() async {
    await Future.delayed(const Duration(milliseconds: 3200));

    if (!mounted) return;

    // ضع هنا كود الـ Navigation
    //
    // مثال:
    //
    // final token = await sl<StorageHelper>().getAccessToken();
    //
    // if (token != null && token.isNotEmpty) {
    //   context.pushReplacementNamed(AppRoutes.mainScreen);
    // } else {
    //   context.pushReplacementNamed(AppRoutes.loginScreen);
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_backgroundAnimation, _pulseAnimation]),
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.lerp(
                    // ignore: deprecated_member_use
                    AppColors.primaryColor.withOpacity(0.06),
                    Colors.white,
                    _backgroundAnimation.value,
                  )!,
                  Colors.white,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // الـ pulse بيتطبق كـ scale إضافي فوق الـ scale الأصلي بتاع الدخول
                  Transform.scale(
                    scale: _pulseAnimation.value,
                    child: SplashLogo(
                      opacity: _logoFadeAnimation,
                      scale: _scaleAnimation,
                      assetPath: AppAssets.logo,
                    ),
                  ),

                  HeightSpace(22),

                  SlideTransition(
                    position: _titleSlideAnimation,
                    child: FadeTransition(
                      opacity: _titleFadeAnimation,
                      child: Text(
                        'Motora',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),

                  HeightSpace(8),

                  SlideTransition(
                    position: _taglineSlideAnimation,
                    child: FadeTransition(
                      opacity: _taglineFadeAnimation,
                      child: Text(
                        'THE FUTURE OF AUTOMOTIVE',
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: 1.2,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
