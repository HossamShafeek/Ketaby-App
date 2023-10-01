import 'package:ketaby/feature/home/data/models/books_model/books_model.dart';

abstract class NewArrivalsState {}

final class NewArrivalsInitial extends NewArrivalsState {}

class NewArrivalsLoadingState extends NewArrivalsState {}

class NewArrivalsSuccessState extends NewArrivalsState {
  final BooksModel bestSellerModel;

  NewArrivalsSuccessState(this.bestSellerModel);
}

class NewArrivalsFailureState extends NewArrivalsState {
  final String error;

  NewArrivalsFailureState(this.error);
}
