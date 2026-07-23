import 'package:go_router/go_router.dart';
import 'package:motora/core/routing/app_routes.dart';
import 'package:motora/features/add_car/add_car_screen.dart';
import 'package:motora/features/auth/login/login_screen.dart';
import 'package:motora/features/auth/sign/sign_up_screen.dart';
import 'package:motora/features/main_screen/main_screen.dart';
import 'package:motora/features/onboarding_screen/onboarding_screen.dart';
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
      GoRoute(
        path: AppRoutes.addScreen,
        name: AppRoutes.addScreen,
        builder: (context, state) => const AddCarScreen(),
      ),
    ],
  );
}
