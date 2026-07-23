import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/my_cart/models/cart_item_model.dart';
import 'package:motora/features/my_cart/widgets/quantity_stepper.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int>? onQuantityChanged;
  final VoidCallback? onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    this.onQuantityChanged,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image section ──────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              width: 64.w,
              height: 64.w,
              color: colors.surfaceContainerHighest,
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                width: 64.w,
                height: 64.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 18.w,
                    height: 18.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.directions_car_outlined,
                  color: colors.onSurfaceVariant,
                  size: 24.sp,
                ),
              ),
            ),
          ),

          WidthSpace(12),

          // ── Details section ─────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.black16SemiBold.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                    // Remove button — top-right, compact hit target
                    InkWell(
                      onTap: onRemove,
                      borderRadius: BorderRadius.circular(20.r),
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Icon(
                          Icons.delete_outline,
                          size: 20.sp,
                          color: colors.error,
                        ),
                      ),
                    ),
                  ],
                ),

                HeightSpace(4),

                Text(
                  '\$${item.price.toStringAsFixed(0)} / each',
                  style: context.grey12Medium,
                ),

                HeightSpace(10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityStepper(
                      current: item.quantity,
                      onChanged: onQuantityChanged,
                    ),
                    Text(
                      '\$${(item.price * item.quantity).toStringAsFixed(0)}',
                      style: context.black16SemiBold.copyWith(
                        color: colors.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
