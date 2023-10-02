import 'package:ketaby/feature/home/data/models/books_model/product.dart';

abstract class AddAndRemoveFavouritesState {}

final class AddAndRemoveFavouritesInitialState extends AddAndRemoveFavouritesState {}

class ChangeFavouritesLoadingState extends AddAndRemoveFavouritesState {}

class ChangeFavouritesSuccessState extends AddAndRemoveFavouritesState {
  final List<Product> prudutes;

  ChangeFavouritesSuccessState(this.prudutes);
}

class ChangeFavouritesFailureState extends AddAndRemoveFavouritesState {
  final String error;

  ChangeFavouritesFailureState(this.error);
}
