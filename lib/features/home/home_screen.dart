import 'package:flutter/material.dart';
import 'package:motora/features/home/models/car_model.dart';
import 'package:motora/features/home/widgets/car_search_bar.dart';
import 'package:motora/features/home/widgets/featured_car_card.dart';
import 'package:motora/features/home/widgets/greeting_section.dart';
import 'package:motora/features/home/widgets/home_app_bar.dart';
import 'package:motora/features/home/widgets/prand_list.dart';
import 'package:motora/features/home/widgets/promo_bannar.dart';
import 'package:motora/features/home/widgets/recomenddation_car_tiel.dart';
import 'package:motora/features/home/widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<BrandItem> _brands = const [
    BrandItem(name: 'Audi', logoUrl: 'https://picsum.photos/seed/audi/60'),
    BrandItem(name: 'BMW', logoUrl: 'https://picsum.photos/seed/bmw/60'),
    BrandItem(name: 'Mercedes', logoUrl: 'https://picsum.photos/seed/mb/60'),
    BrandItem(name: 'Tesla', logoUrl: 'https://picsum.photos/seed/tesla/60'),
    BrandItem(
      name: 'Porsche',
      logoUrl: 'https://picsum.photos/seed/porsche/60',
    ),
  ];

  final List<CarModel> _featuredCars = const [
    CarModel(
      id: '1',
      name: '2024 Porsche 911',
      subtitle: '',
      price: 114400,
      imageUrl: 'https://picsum.photos/seed/porsche911/400/300',
      year: 2024,
      mileageOrTransmission: 'Auto',
      color: 'Gray',
      isCertified: true,
    ),
  ];

  final List<CarModel> _recommendedCars = const [
    CarModel(
      id: '2',
      name: 'Tesla Model Y',
      subtitle: 'Dual Motor All-Wheel Drive',
      price: 42990,
      imageUrl: 'https://picsum.photos/seed/modely/200/150',
      year: 2023,
      mileageOrTransmission: '12k miles',
      color: 'White',
    ),
    CarModel(
      id: '3',
      name: 'BMW X5 xDrive40i',
      subtitle: 'M Sport Package, Premium Hi-Fi',
      price: 58500,
      imageUrl: 'https://picsum.photos/seed/bmwx5/200/150',
      year: 2022,
      mileageOrTransmission: '24k miles',
      color: 'Gray',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        avatarUrl: 'https://picsum.photos/seed/avatar/80',

        onAvatarTap: () {},
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const GreetingSection(userName: 'Alex'),
            CarSearchBar(controller: _searchController, onFilterTap: () {}),
            PromoBanner(
              badgeText: 'NEW ARRIVAL',
              title: 'Experience The\nFuture of Speed',
              buttonText: 'Explore New Arrivals',
              backgroundImageUrl: 'https://picsum.photos/seed/city/600/400',
              onButtonTap: () {},
            ),
            SectionHeader(title: 'Popular Brands', onActionTap: () {}),
            BrandList(brands: _brands, onBrandTap: (brand) {}),
            SectionHeader(title: 'Featured Cars', onActionTap: () {}),
            SizedBox(
              height: 290,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _featuredCars.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) => FeaturedCarCard(
                  car: _featuredCars[index],
                  onTap: () {},
                  onFavoriteToggle: () {},
                ),
              ),
            ),
            SectionHeader(title: 'Recommended For You', onActionTap: () {}),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _recommendedCars.length,
              itemBuilder: (context, index) => RecommendedCarTile(
                car: _recommendedCars[index],
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
