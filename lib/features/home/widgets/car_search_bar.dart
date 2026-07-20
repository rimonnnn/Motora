import 'package:flutter/material.dart';
import 'package:motora/core/styling/app_colors.dart';

/// Rounded search field with a filter/sliders icon on the trailing side.
/// onFilterTap is exposed separately from text input so the filter
/// sheet logic can live outside this widget (single responsibility).
class CarSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const CarSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search for your dream car',
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.secondaryColor),
            prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
            suffixIcon: IconButton(
              icon: Icon(Icons.tune, color: AppColors.primaryColor),
              onPressed: onFilterTap,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}
