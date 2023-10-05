import 'package:ketaby/feature/home/data/models/books_model/product.dart';

abstract class GetFavouritesState {}

final class GetFavouritesInitialState extends GetFavouritesState {}

class GetFavouritesLoadingState extends GetFavouritesState {}

class GetFavouritesSuccessState extends GetFavouritesState {
  final List<Product> products;

  GetFavouritesSuccessState(this.products);
}

class GetFavouritesFailureState extends GetFavouritesState {
  final String error;

  GetFavouritesFailureState(this.error);
}
