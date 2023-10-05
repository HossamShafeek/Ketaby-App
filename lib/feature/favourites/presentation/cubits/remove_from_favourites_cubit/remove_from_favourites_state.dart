
abstract class RemoveFromFavouritesState {}

final class RemoveFromFavouritesInitialState extends RemoveFromFavouritesState {}

class RemoveFromFavouritesLoadingState extends RemoveFromFavouritesState {}

class RemoveFromFavouritesSuccessState extends RemoveFromFavouritesState {
}

class RemoveFromFavouritesFailureState extends RemoveFromFavouritesState {
  final String error;

  RemoveFromFavouritesFailureState(this.error);
}
