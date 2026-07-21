import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';

class QuantityStepper extends StatefulWidget {
  final int current;
  final ValueChanged<int>? onChanged;
  final int minQuantity;
  final int maxQuantity;

  const QuantityStepper({
    super.key,
    required this.current,
    this.onChanged,
    this.minQuantity = 1,
    this.maxQuantity = 99,
  });

  @override
  State<QuantityStepper> createState() => _QuantityStepperState();
}

class _QuantityStepperState extends State<QuantityStepper> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.current;
  }

  // لو الـ parent غيّر الكمية من برّه (زي لو رجّع الكارت لحالة سابقة)
  // لازم الـ widget يتزامن معاها
  @override
  void didUpdateWidget(covariant QuantityStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.current != widget.current) {
      _quantity = widget.current;
    }
  }

  void _updateQuantity(int newValue) {
    setState(() => _quantity = newValue);
    widget.onChanged?.call(newValue);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decrease button
        IconButton(
          icon: Icon(Icons.remove, size: 16.sp),
          onPressed: _quantity > widget.minQuantity
              ? () => _updateQuantity(_quantity - 1)
              : null,
          color: colors.onSurface,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 28.w, minHeight: 28.w),
        ),
    
        WidthSpace(12),
    
        // Quantity display
        Text('$_quantity', style: context.black16SemiBold),
    
        WidthSpace(12),
    
        // Increase button
        IconButton(
          icon: Icon(Icons.add, size: 16.sp),
          onPressed: _quantity < widget.maxQuantity
              ? () => _updateQuantity(_quantity + 1)
              : null,
          color: colors.onSurface,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 28.w, minHeight: 28.w),
        ),
      ],
    );
  }
}
