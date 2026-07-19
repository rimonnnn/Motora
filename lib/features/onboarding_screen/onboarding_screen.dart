import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/core/styling/app_styles.dart';
import 'package:motora/core/utils/storage_helper.dart';
import 'package:motora/core/widgets/primary_button_widget.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/onboarding_screen/models/onboarding_item.dart';
import 'package:motora/features/onboarding_screen/widgets/onboarding_page.dart';
import 'package:motora/features/onboarding_screen/widgets/page_indecator.dart';
import 'package:motora/features/onboarding_screen/widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Future<void> _finishOnboarding() async {
    await StorageHelper.setOnboardingSeen();

    if (!mounted) return;

    context.pushReplacementNamed(AppRoutes.mainScreen);
  }

  Future<void> _onNextPressed() async {
    final isLastPage = _currentPage == onboardingItems.length - 1;

    if (isLastPage) {
      await StorageHelper.setOnboardingSeen();

      if (!mounted) return;

      context.pushReplacementNamed(AppRoutes.mainScreen);
    } else {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool get _isLastPage => _currentPage == onboardingItems.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motora", style: AppStyles.primaryHeadLineStyle),
        centerTitle: true,
        actions: [
          SkipButton(
            onPress: () {
              _finishOnboarding();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingItems.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(item: onboardingItems[index]);
              },
            ),
          ),

          PageIndecator(
            controller: _pageController,
            count: onboardingItems.length,
          ),
          HeightSpace(16),
          PrimaryButtonWidget(
            width: 300.w,
            onPress: _onNextPressed,
            buttonText: _isLastPage ? "Get Started" : "Next",
          ),
          HeightSpace(43),
        ],
      ),
    );
  }
}
