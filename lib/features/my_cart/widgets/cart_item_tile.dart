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
    debugPrint('🔥🔥🔥 CartItemTile REBUILT 🔥🔥🔥');
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Car image section
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: SizedBox(
            width: 56.w,
            height: 56.w,
            child: Image.network(
              item.imageUrl,
              width: 56.w,
              height: 56.w,
              fit: BoxFit.cover,
            ),
          ),
        ),

        WidthSpace(12),

        // Details section — بياخد المساحة المتبقية بعد الصورة وزرار الحذف
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.black16SemiBold.copyWith(
                  color: colors.onSurface,
                ),
              ),

              HeightSpace(4),

              Text(
                '\$${item.price.toStringAsFixed(0)}',
                style: context.grey12Medium,
              ),

              HeightSpace(8),

              QuantityStepper(
                current: item.quantity,
                onChanged: onQuantityChanged,
              ),

              HeightSpace(4),

              Text(
                '\$${(item.price * item.quantity).toStringAsFixed(0)}',
                style: context.black16SemiBold.copyWith(
                  color: colors.onSurface,
                ),
              ),
            ],
          ),
        ),

        // Remove button — IconButton مضغوط بدل TextButton
        // (TextButton له حد أدنى للعرض بيسبب overflow في Row ضيقة)
        IconButton(
          onPressed: onRemove,
          icon: Icon(Icons.delete_outline, size: 20.sp),
          color: colors.error,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.w),
        ),
      ],
    );
  }
}
