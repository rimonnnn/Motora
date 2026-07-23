import 'package:flutter/material.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';

class ProfileHeader extends StatelessWidget {
  final String username;

  const ProfileHeader({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back,',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
          ),
        ),
        SizedBox(height: 8),
        Text(
          username,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : colors.primary,
            height: 1.2,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.verified, color: Colors.black, size: 16),
            SizedBox(width: 4),
            Text('Motora Rider', style: context.suptitle),
          ],
        ),
      ],
    );
  }
}
