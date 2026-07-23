import 'package:flutter/material.dart';
import 'package:motora/core/widgets/circle_icon_button.dart';

class ProfileSettings extends StatelessWidget {
  final BuildContext context;

  const ProfileSettings({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: ListView(
        children: [
          _buildSettingTile(
            icon: Icons.person,
            title: 'Edit Profile',
            onTap: () {},
            isDarkMode: isDarkMode,
          ),
          _buildSettingTile(
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () {},
            isDarkMode: isDarkMode,
          ),
          _buildSettingTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {},
            isDarkMode: isDarkMode,
          ),
          _buildSettingTile(
            icon: Icons.favorite,
            title: 'Wishlist',
            onTap: () {},
            isDarkMode: isDarkMode,
          ),
          _buildSettingTile(
            icon: Icons.history,
            title: 'Order History',
            onTap: () {},
            isDarkMode: isDarkMode,
          ),
          Divider(height: 32),
          _buildSettingTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () => logOut(context),
            isDarkMode: isDarkMode,
            primaryColor: colors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDarkMode,
    Color? primaryColor,
  }) {
    return ListTile(
      leading: CircleIconButton(
        icon: icon,
        iconColor: primaryColor ?? (isDarkMode ? Colors.white : Colors.blue),
        onTap: () {},
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: isDarkMode ? Colors.white70 : Colors.grey,
      ),
      onTap: onTap,
    );
  }
}

void logOut(BuildContext context) {
  // This function will be implemented later when auth service is ready
  // ScaffoldMessenger.of(context).showSnackBar(...);
}
