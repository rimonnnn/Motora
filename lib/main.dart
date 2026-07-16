import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/routing/router_generator_config.dart';

// import 'core/theme/app_theme.dart'; // ملف الـ Theme بتاعك اللي فيه الـ Material 3 tokens

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Motora());
}

class Motora extends StatelessWidget {
  const Motora({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 885),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: RouterGeneratorConfig.goRouter,
          title: 'Shopino',
          debugShowCheckedModeBanner: false,
        );
      },
      child: Scaffold(),
    );
  }
}
