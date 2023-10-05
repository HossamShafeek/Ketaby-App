abstract class GetCartState {}

class GetCartInitialState extends GetCartState {}

class GetCartLoadingState extends GetCartState {}

class GetCartSuccessState extends GetCartState {}

class GetCartFailureState extends GetCartState {
  final String error;

  GetCartFailureState(this.error);
}
