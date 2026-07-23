// features/add_car/domain/repositories/add_car_repository.dart

import 'package:motora/features/add_car/model/new_car_model.dart';

abstract class AddCarRepository {
  Future<void> addCar(NewCarModel car);
}
