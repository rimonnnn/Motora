import 'package:flutter/material.dart';
import 'package:motora/core/utils/theme_toggle_button.dart';

/// Top app bar: menu icon + "MOTORA" logo + theme toggle + notification bell + avatar.
/// Kept as a reusable widget so it can be dropped into other screens
/// (e.g. Search, Favorites) without duplicating layout code.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;
  final VoidCallback? onMenuTap;
  final VoidCallback? onAvatarTap;

  const HomeAppBar({
    super.key,
    required this.avatarUrl,
    this.onMenuTap,

    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: colors.secondary),
        onPressed: onMenuTap,
      ),
      title: Text(
        'MOTORA',
        style: TextStyle(
          color: colors.primary,
          fontWeight: FontWeight.w800,
          fontSize: 22,
          letterSpacing: 0.5,
        ),
      ),
      centerTitle: false,
      actions: [
        const ThemeToggleButton(), // <-- زرار تبديل الـ theme

        GestureDetector(
          onTap: onAvatarTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
