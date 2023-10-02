import 'package:ketaby/feature/home/data/models/books_model/product.dart';

abstract class RemoveFromFavouritesState {}

final class RemoveFromFavouritesInitialState
    extends RemoveFromFavouritesState {}

class RemoveFromFavouritesLoadingState extends RemoveFromFavouritesState {}

class RemoveFromFavouritesSuccessState extends RemoveFromFavouritesState {
  final List<Product> prudutes;

  RemoveFromFavouritesSuccessState(this.prudutes);
}

class RemoveFromFavouritesFailureState extends RemoveFromFavouritesState {
  final String error;

  RemoveFromFavouritesFailureState(this.error);
}
