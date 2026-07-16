import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/features/splash_screen/splash_screen.dart';

// import 'core/theme/app_theme.dart'; // ملف الـ Theme بتاعك اللي فيه الـ Material 3 tokens

void main() {
  runApp(const WispApp());
}

class WispApp extends StatelessWidget {
  const WispApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 885),
      child: MaterialApp(
        title: 'Motora',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(
              0xFF2196F3,
            ), // غيّرها بالـ seed color بتاعك من Stitch
          ),
          // theme: AppTheme.lightTheme, // لو عندك ملف theme جاهز، استبدل بيه السطرين فوق
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2196F3),
            brightness: Brightness.dark,
          ),
          // darkTheme: AppTheme.darkTheme,
        ),
        themeMode: ThemeMode.system,
        home: SplashScreen(),
      ),
    );
  }
}
