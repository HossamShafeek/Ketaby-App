import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/feature/favourites/data/repository/favourites_repository.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/add_to_favourites_cubit/add_to_favourites_state.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class AddToFavouritesCubit extends Cubit<AddToFavouritesState> {
  AddToFavouritesCubit(this.favouritesRepository)
      : super(AddToFavouritesInitialState());

  static AddToFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final FavouritesRepository favouritesRepository;

  Future<void> addToFavourites(
      {required String bookId, required BuildContext context}) async {
    emit(AddToFavouritesLoadingState());
    Either<Failure, List<Product>> result;
    result = await favouritesRepository.addToFavourites(bookId: bookId);
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(AddToFavouritesFailureState(failure.error));
    }, (products) {
      showSuccessSnackBar(
          context: context, message: 'Product Added To Favourites');
      emit(AddToFavouritesSuccessState());
    });
  }
}
