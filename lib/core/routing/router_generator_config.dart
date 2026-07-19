import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/features/login_screen/login_screen.dart';
import 'package:motora/features/main_screen/main_screen.dart';
import 'package:motora/features/onboarding_screen/onboarding_screen.dart';
import 'package:motora/features/sign_up_screen/sign_up_screen.dart';
import 'package:motora/features/splash_screen/splash_screen.dart';

class RouterGeneratorConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,

    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.mainScreen,
        name: AppRoutes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingScreen,
        name: AppRoutes.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
}
