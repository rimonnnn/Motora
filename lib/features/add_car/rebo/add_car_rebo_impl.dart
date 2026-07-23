import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:motora/features/add_car/model/new_car_model.dart';
import 'package:motora/features/add_car/rebo/add_car_rebosatory.dart';

class AddCarRepositoryImpl implements AddCarRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  AddCarRepositoryImpl({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  @override
  Future<void> addCar(NewCarModel car) async {
    // 1. Upload image first — the Firestore doc needs its URL
    final imageUrl = await _uploadImage(car.imageFile);

    // 2. Write the document with everything already in place
    await _firestore.collection('cars').add({
      'name': car.name,
      'price': car.price,
      'description': car.description,
      'category': car.category,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<String> _uploadImage(File file) async {
    // Timestamp-based name so uploads never collide
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final ref = _storage.ref().child('car_images/$fileName');
    final uploadTask = await ref.putFile(file);
    return uploadTask.ref.getDownloadURL();
  }
}