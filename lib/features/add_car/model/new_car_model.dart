// features/add_car/models/new_car_model.dart
import 'dart:io';

class NewCarModel {
  final String name;
  final double price;
  final String description;
  final String category;
  final File imageFile;

  const NewCarModel({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.imageFile,
  });
}