import 'package:flutter/material.dart';

/// A single brand: logo + name (Audi, BMW, Mercedes, Tesla, Porsche...)
class BrandItem {
  final String name;
  final String logoUrl;
  const BrandItem({required this.name, required this.logoUrl});
}

/// Horizontal scrollable row of brand logos.
/// Data-driven via [brands] list so adding/removing brands
/// never touches this widget's code.
class BrandList extends StatelessWidget {
  final List<BrandItem> brands;
  final ValueChanged<BrandItem>? onBrandTap;

  const BrandList({super.key, required this.brands, this.onBrandTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: brands.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final brand = brands[index];
          return GestureDetector(
            onTap: () => onBrandTap?.call(brand),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: colors.surface,
                  backgroundImage: NetworkImage(brand.logoUrl),
                ),
                const SizedBox(height: 6),
                Text(
                  brand.name,
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
