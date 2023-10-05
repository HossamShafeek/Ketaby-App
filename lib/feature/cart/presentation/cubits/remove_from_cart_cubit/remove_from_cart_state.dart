abstract class RemoveFromCartState {}

class RemoveFromCartInitialState extends RemoveFromCartState {}

class RemoveFromCartLoadingState extends RemoveFromCartState {}

class RemoveFromCartSuccessState extends RemoveFromCartState {}

class RemoveFromCartFailureState extends RemoveFromCartState {
  final String error;
  RemoveFromCartFailureState(this.error);
}
