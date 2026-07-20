import 'package:flutter/material.dart';

import '../models/car_model.dart';

/// Horizontal list tile used in "Recommended For You":
/// thumbnail on the left, name/price/subtitle/details on the right,
/// chevron to indicate it's tappable.
class RecommendedCarTile extends StatelessWidget {
  final CarModel car;
  final VoidCallback? onTap;

  const RecommendedCarTile({super.key, required this.car, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                car.imageUrl,
                width: 90,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        // الاسم بياخد المساحة المتاحة وياخد أولوية أكبر
                        flex: 3,
                        child: Text(
                          car.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        // السعر ياخد مساحة أقل، ولو طويل يتقطع بدل ما يعمل overflow
                        flex: 2,
                        child: Text(
                          car.formattedPrice,
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (car.subtitle.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      car.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    '${car.year}  •  ${car.mileageOrTransmission}  •  ${car.color}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
