import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/styling/app_theme.dart';
import 'package:motora/core/widgets/circle_icon_button.dart';
import 'package:motora/core/widgets/profile/profile_avatar.dart';
import 'package:motora/core/widgets/profile/profile_header.dart';
import 'package:motora/core/widgets/profile/profile_settings.dart';
import 'package:motora/main.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
        
            color: isDarkMode ? Colors.white : Colors.blue,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileHeader(username: 'Motora Rider'),
            SizedBox(height: 24),
            ProfileAvatar(
              username: 'Motora Rider',
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: 32),
            ProfileSettings(context: context),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Settings'),
              leading: CircleIconButton(
                icon: Icons.settings,
                iconColor: isDarkMode ? Colors.white : Colors.blue, onTap: () {  },
              ),
            ),
            ListTile(
              title: Text('Privacy Policy'),
              leading: CircleIconButton(
                icon: Icons.verified,
              iconColor: isDarkMode ? Colors.white : Colors.blue, onTap: () {  },
              ),
            ),
            ListTile(
              title: Text('Terms of Service'),
              leading: CircleIconButton(
                icon: Icons.help,
              iconColor: isDarkMode ? Colors.white : Colors.blue, onTap: () {  },
              ),
            ),
            Divider(),
           
              
            
            ListTile(
              title: Text('Logout'),
              leading: CircleIconButton(
                icon: Icons.logout,
                iconColor: isDarkMode ? Colors.white : Colors.blue, onTap: () {  },
              ),
              onTap: () {
                // Handle logout logic
              
                themeModeNotifier.value = ThemeMode.light;
              },
            ),
          ],
        ),
      ),
    );
  }
}