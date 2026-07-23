// features/add_car/presentation/cubit/add_car_cubit.dart
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:motora/features/add_car/model/new_car_model.dart';
import 'package:motora/features/add_car/rebo/add_car_rebosatory.dart';

part 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  final AddCarRepository _repository;

  AddCarCubit(this._repository) : super(const AddCarInitial());

  File? imageFile;
  String selectedCategory = 'Sedan';

  void setImage(File file) {
    imageFile = file;
    emit(const AddCarInitial());
  }

  void setCategory(String category) {
    selectedCategory = category;
    emit(const AddCarInitial());
  }

  Future<void> submit({
    required String name,
    required String priceText,
    required String description,
  }) async {
    if (name.trim().isEmpty) {
      emit(const AddCarFailure('اسم السيارة مطلوب'));
      return;
    }
    final price = double.tryParse(priceText);
    if (price == null || price <= 0) {
      emit(const AddCarFailure('السعر غير صالح'));
      return;
    }
    if (imageFile == null) {
      emit(const AddCarFailure('من فضلك اختر صورة'));
      return;
    }

    emit(const AddCarLoading());

    try {
      await _repository.addCar(
        NewCarModel(
          name: name.trim(),
          price: price,
          description: description.trim(),
          category: selectedCategory,
          imageFile: imageFile!,
        ),
      );
      emit(const AddCarSuccess());
    } catch (e) {
      emit(AddCarFailure(e.toString()));
    }
  }
}
