import 'package:flutter/material.dart';
import 'package:motora/core/utils/storage_helper.dart';
import 'package:motora/main.dart'; // فيه themeModeNotifier

/// Simple icon button that flips between light and dark mode.
/// Reads the CURRENT rendered brightness (works correctly even when
/// themeMode is ThemeMode.system) and flips the global notifier,
/// then persists the choice so it survives app restarts.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
      onPressed: () {
        final newMode = isDark ? ThemeMode.light : ThemeMode.dark;

        themeModeNotifier.value = newMode; // يغيّر الـ UI فورًا
        StorageHelper.setThemeMode(newMode); // يحفظ الاختيار في الخلفية
      },
    );
  }
}
