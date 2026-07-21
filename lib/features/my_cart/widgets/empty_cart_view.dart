import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';

/// Shown when the cart has no items. Encourages the user to go back
/// and browse cars instead of leaving them on a blank screen.
class EmptyCartView extends StatelessWidget {
  final VoidCallback? onBrowseCars;

  const EmptyCartView({super.key, this.onBrowseCars});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 72.sp,
              color: colors.onSurfaceVariant,
            ),

            HeightSpace(16),

            Text(
              'Your cart is empty',
              style: context.black16SemiBold.copyWith(color: colors.onSurface),
            ),

            HeightSpace(8),

            Text(
              'Looks like you haven\'t added any cars yet. '
              'Start browsing to find your next ride.',
              textAlign: TextAlign.center,
              style: context.grey12Medium.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),

            HeightSpace(24),

            ElevatedButton(
              onPressed: onBrowseCars,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text('Browse Cars', style: context.white15W500),
            ),
          ],
        ),
      ),
    );
  }
}
