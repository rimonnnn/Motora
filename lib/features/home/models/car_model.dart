class CarModel {
  final String id;
  final String name;
  final String subtitle; // e.g. "Dual Motor All-Wheel Drive"
  final double price;
  final String imageUrl;
  final int year;
  final String mileageOrTransmission; // "12k miles" or "Auto"
  final String color;
  final bool isCertified;
  final bool isFavorite;

  const CarModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.year,
    required this.mileageOrTransmission,
    required this.color,
    this.isCertified = false,
    this.isFavorite = false,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(0)}';
}
