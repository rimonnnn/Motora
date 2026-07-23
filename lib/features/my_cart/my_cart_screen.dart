import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/floating_add_button.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/my_cart/models/cart_item_model.dart';
import 'package:motora/features/my_cart/widgets/cart_item_tile.dart';
import 'package:motora/features/my_cart/widgets/cart_summary_card.dart';
import 'package:motora/features/my_cart/widgets/empty_cart_view.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  // Placeholder data
  final List<CartItem> _items = [
    const CartItem(
      id: '1',
      name: 'Tesla Model 3',
      price: 42999,
      imageUrl: 'https://via.placeholder.com/160',
      quantity: 1,
    ),
    const CartItem(
      id: '2',
      name: 'BMW i4',
      price: 55999,
      imageUrl: 'https://via.placeholder.com/160',
      quantity: 2,
    ),
  ];

  void _updateQuantity(int index, int quantity) {
    setState(() {
      _items[index] = _items[index].copyWith(quantity: quantity);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _onBrowseCars() => Navigator.of(context).pop();

  void _onCheckout() {}

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('My Cart', style: context.black16SemiBold),
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
      ),
      body: _items.isEmpty
          ? EmptyCartView(onBrowseCars: _onBrowseCars)
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    itemCount: _items.length,
                    separatorBuilder: (context, index) => HeightSpace(12),
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return CartItemTile(
                        key: ValueKey(item.id),
                        item: item,
                        onQuantityChanged: (qty) => _updateQuantity(index, qty),
                        onRemove: () => _removeItem(index),
                      );
                    },
                  ),
                ),
                CartSummaryCard(items: _items, onCheckoutTap: _onCheckout),
              ],
            ),
      floatingActionButton: const FloatingAddButton(),
    );
  }
}
