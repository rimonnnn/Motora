import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/primary_button_widget.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/my_cart/models/cart_item_model.dart';

class CartSummaryCard extends StatelessWidget {
  final List<CartItem> items;
  final VoidCallback? onCheckoutTap;

  const CartSummaryCard({super.key, required this.items, this.onCheckoutTap});

  double get _subtotal =>
      items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  double get _tax => _subtotal * 0.1;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Order Summary', style: context.black16SemiBold),

          HeightSpace(12),

          _buildRow(context, 'Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),

          HeightSpace(12),

          _buildRow(context, 'Tax (10%)', '\$${_tax.toStringAsFixed(2)}'),

          HeightSpace(8),

          Divider(color: colors.onSurfaceVariant.withValues(alpha: 0.15)),

          HeightSpace(12),

          _buildRow(
            context,
            'Total',
            '\$${(_subtotal + _tax).toStringAsFixed(2)}',
            isTotal: true,
          ),

          HeightSpace(16),

          Center(
            child: PrimaryButtonWidget(
              onPress: () {},
              buttonColor: AppColors.primaryColor,
              buttonText: "Checkout",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    String value, {
    bool isTotal = false,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? context.black16SemiBold.copyWith(color: colors.onSurface)
              : context.grey12Medium.copyWith(color: colors.onSurfaceVariant),
        ),
        Text(
          value,
          style: isTotal
              ? context.black16SemiBold.copyWith(color: colors.onSurface)
              : context.grey12Medium.copyWith(color: colors.onSurfaceVariant),
        ),
      ],
    );
  }
}
