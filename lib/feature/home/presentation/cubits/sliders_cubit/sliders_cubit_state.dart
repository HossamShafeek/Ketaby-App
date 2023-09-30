part of 'sliders_cubit_cubit.dart';

abstract class SlidersState {}

final class SlidersInitial extends SlidersState {}

class SlidersLoadingState extends SlidersState {}

class SlidersSuccessState extends SlidersState {
  final SlidersModel slidersModel;

  SlidersSuccessState(this.slidersModel);
}

class SlidersFailureState extends SlidersState {
  final String error;

  SlidersFailureState(this.error);
}
