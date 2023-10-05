
abstract class AddToFavouritesState {}

final class AddToFavouritesInitialState extends AddToFavouritesState {}

class AddToFavouritesLoadingState extends AddToFavouritesState {}

class AddToFavouritesSuccessState extends AddToFavouritesState {
}

class AddToFavouritesFailureState extends AddToFavouritesState {
  final String error;

  AddToFavouritesFailureState(this.error);
}
