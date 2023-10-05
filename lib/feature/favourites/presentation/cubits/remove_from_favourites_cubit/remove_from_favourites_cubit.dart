import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/feature/favourites/data/repository/favourites_repository.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/remove_from_favourites_cubit/remove_from_favourites_state.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class RemoveFromFavouritesCubit extends Cubit<RemoveFromFavouritesState> {
  RemoveFromFavouritesCubit(this.favouritesRepository)
      : super(RemoveFromFavouritesInitialState());

  static RemoveFromFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final FavouritesRepository favouritesRepository;

  Future<void> removeFromFavourites(
      {required String bookId, required BuildContext context}) async {
    emit(RemoveFromFavouritesLoadingState());
    Either<Failure, List<Product>> result;
    result = await favouritesRepository.removeToFavourites(bookId: bookId);
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(RemoveFromFavouritesFailureState(failure.error));
    }, (products) {
      showSuccessSnackBar(
          context: context, message: 'Product Removed From Favourites');
      emit(RemoveFromFavouritesSuccessState());
    });
  }
}
