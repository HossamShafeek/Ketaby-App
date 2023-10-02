import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/favourites/data/repository/favourites_repository.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/add_and_remove_favourites_cubit/add_and_remove_favourites_state.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class AddAndRemoveFavouritesCubit extends Cubit<AddAndRemoveFavouritesState> {
  AddAndRemoveFavouritesCubit(this.favouritesRepository)
      : super(AddAndRemoveFavouritesInitialState());

  static AddAndRemoveFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final FavouritesRepository favouritesRepository;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<Product> products = [];

  Future<void> addToFavourites({required String bookId}) async {
    emit(ChangeFavouritesLoadingState());
    Either<Failure, List<Product>> result;
    result = await favouritesRepository.addToFavourites(bookId: bookId);
    result.fold((failure) {
      emit(ChangeFavouritesFailureState(failure.error));
    }, (products) {
      this.products = products;
      print('==================================');
      print(products.length);
      emit(ChangeFavouritesSuccessState(products));
    });
  }





}
