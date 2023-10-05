abstract class AddToCartState {}

class AddToCartInitialState extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {}

class AddToCartFailureState extends AddToCartState {
  final String error;
  AddToCartFailureState(this.error);
}