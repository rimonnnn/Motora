import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/routing/router_generator_config.dart';
import 'package:motora/core/styling/app_theme.dart';
import 'package:motora/core/utils/storage_helper.dart';
import 'package:motora/firebase_options.dart';

/// Global theme-mode holder. Flip it from anywhere with:
/// themeModeNotifier.value = ThemeMode.dark;
/// MaterialApp.router listens to it and rebuilds automatically.
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(
  ThemeMode.system,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // نقرا الـ theme المحفوظ قبل ما الـ app يشتغل، عشان أول رسمة
  // تبقى بالـ theme الصح من غير flash بالـ default
  final savedTheme = await StorageHelper.getThemeMode();
  themeModeNotifier.value = savedTheme;

  runApp(const Motora());
}

class Motora extends StatelessWidget {
  const Motora({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 885),
      minTextAdapt: true,
      splitScreenMode: false,
      // ملاحظة: شلت "child: Scaffold()" اللي كانت هنا — الـ builder
      // بتاعك مش بياخد الـ child أصلاً ولا بيستخدمه، فكان كود ميت
      // (Scaffold فاضي بيتبني وميتشافش أبدًا). لو محتاج splash/loading
      // widget أثناء init، استخدم builder نفسه مش الـ child param.
      builder: (context, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeModeNotifier,
          builder: (context, mode, _) {
            return MaterialApp.router(
              routerConfig: RouterGeneratorConfig.goRouter,
              title: 'Motora',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: mode, // ThemeMode.system / .light / .dark
            );
          },
        );
      },
    );
  }
}
