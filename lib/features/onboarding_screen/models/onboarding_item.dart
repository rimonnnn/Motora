import 'package:motora/core/styling/app_assets.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

const onboardingItems = [
  OnboardingItem(
    image: AppAssets.onboarding1,
    title: 'Find Your Dream Car',
    description: 'Browse thousands of cars from trusted dealers.',
  ),
  OnboardingItem(
    image: AppAssets.onboarding2,
    title: 'Compare Prices',
    description: 'Compare different models with ease.',
  ),
  OnboardingItem(
    image: AppAssets.onboarding3,
    title: 'Buy With Confidence',
    description: 'Secure deals and verified sellers.',
  ),
];
