import 'package:flutter/material.dart';

/// "Hello, {name}" + subtitle. Takes the user's name as a param
/// so it can be reused for any logged-in user, not hardcoded.
class GreetingSection extends StatelessWidget {
  final String userName;
  final String subtitle;

  const GreetingSection({
    super.key,
    required this.userName,
    this.subtitle = 'Ready to find your next adventure?',
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, $userName',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: colors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
