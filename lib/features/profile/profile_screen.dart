import 'package:flutter/material.dart';
import 'package:motora/core/widgets/profile/profile_avatar.dart';
import 'package:motora/core/widgets/profile/profile_header.dart';
import 'package:motora/core/widgets/profile/profile_settings.dart';
import 'package:motora/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, themeMode, _) {
        final isDarkMode = themeMode == ThemeMode.dark;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.blue),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(username: 'Motora Rider'),
                const SizedBox(height: 24),
                Center(
                  child: ProfileAvatar(
                    username: 'Motora Rider',
                    isDarkMode: isDarkMode,
                  ),
                ),
                const SizedBox(height: 32),
                ProfileSettings(context: context),
              ],
            ),
          ),
        );
      },
    );
  }
}
