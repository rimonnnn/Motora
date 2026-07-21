import 'package:flutter/material.dart';
import 'package:motora/core/styling/app_colors.dart';
import 'package:motora/features/home/home_screen.dart';
import 'package:motora/features/my_cart/my_cart_screen.dart';
import 'package:motora/features/profile/profile_screen.dart';
import 'package:motora/features/sell/sell_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MyCartScreen(),
    SellScreen(),
    ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed, // مهم لما يكون عندك 4+ items
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: AppColors.primaryColor),
            label: 'Home',
            backgroundColor: AppColors.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            activeIcon: Icon(
              Icons.shopping_cart,
              color: AppColors.primaryColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            activeIcon: Icon(
              Icons.sell_outlined,
              color: AppColors.primaryColor,
            ),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: AppColors.primaryColor),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
