// features/add_car/presentation/cubit/add_car_state.dart
part of 'add_car_cubit.dart';

sealed class AddCarState {
  const AddCarState();
}

class AddCarInitial extends AddCarState {
  const AddCarInitial();
}

class AddCarLoading extends AddCarState {
  const AddCarLoading();
}

class AddCarSuccess extends AddCarState {
  const AddCarSuccess();
}

class AddCarFailure extends AddCarState {
  final String message;
  const AddCarFailure(this.message);
}