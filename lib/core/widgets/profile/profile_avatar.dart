import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String username;
  final bool isDarkMode;

  const ProfileAvatar({
    super.key,
    required this.username,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final initial = username.isNotEmpty ? username[0].toUpperCase() : '?';

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: isDarkMode
              ? [Colors.grey[700]!, Colors.grey[600]!]
              : [colors.primary, colors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: isDarkMode ? Colors.grey[600]! : Colors.white,
          width: 3,
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.white,
          ),
        ),
      ),
    );
  }
}
