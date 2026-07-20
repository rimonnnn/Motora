import 'package:flutter/material.dart';
import 'package:motora/core/styling/app_colors.dart';

import '../models/car_model.dart';

/// Card used in the horizontal "Featured Cars" carousel.
/// Shows image with a "CERTIFIED" badge + favorite heart overlay,
/// then name/price/year/mileage/transmission below.
class FeaturedCarCard extends StatelessWidget {
  final CarModel car;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final double width;

  const FeaturedCarCard({
    super.key,
    required this.car,
    this.onTap,
    this.onFavoriteToggle,
    this.width = 260,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: colors.surface, // خلفية الكارت
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  car.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (car.isCertified)
                  const Positioned(top: 10, left: 10, child: _CertifiedBadge()),
                Positioned(
                  top: 10,
                  right: 10,
                  child: _FavoriteButton(
                    isFavorite: car.isFavorite,
                    onTap: onFavoriteToggle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface, // اسم العربية
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    car.formattedPrice,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor, // السعر يبان بلون البراند
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.calendar_today,
                        label: '${car.year}',
                      ),
                      const SizedBox(width: 12),
                      _InfoChip(
                        icon: Icons.speed,
                        label: car.mileageOrTransmission,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CertifiedBadge extends StatelessWidget {
  const _CertifiedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        // اللون هنا مقصود يفضل ثابت (أسود دايمًا) — الهدف إنه يبقى
        // واضح وعالي التباين فوق أي صورة عربية، بغض النظر عن الـ theme
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified, color: AppColors.whiteColor, size: 12),
          const SizedBox(width: 4),
          Text(
            'CERTIFIED',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onTap;
  const _FavoriteButton({required this.isFavorite, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: colors.surface,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 16,
          color: isFavorite ? Colors.red : AppColors.greyColor,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: colors.onSurfaceVariant),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant),
        ),
      ],
    );
  }
}
