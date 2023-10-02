import 'package:ketaby/feature/home/data/models/books_model/books_model.dart';

abstract class BestSellerState {}

final class BestSellerInitialstate extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerSuccessState extends BestSellerState {
  final BooksModel bestSellerModel;

  BestSellerSuccessState(this.bestSellerModel);
}

class BestSellerFailureState extends BestSellerState {
  final String error;

  BestSellerFailureState(this.error);
}
