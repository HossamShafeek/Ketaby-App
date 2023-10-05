import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/favourites/data/repository/favourites_repository.dart';
import 'package:ketaby/feature/favourites/presentation/cubits/get_favourites_cubit/get_favourites_state.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

class GetFavouritesCubit extends Cubit<GetFavouritesState> {
  GetFavouritesCubit(this.favouritesRepository)
      : super(GetFavouritesInitialState());

  static GetFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final FavouritesRepository favouritesRepository;

  List<Product> products = [];

  Future<void> getFavourites() async {
    emit(GetFavouritesLoadingState());
    Either<Failure, List<Product>> result;
    result = await favouritesRepository.getFavourites();
    result.fold((failure) {
      emit(GetFavouritesFailureState(failure.error));
    }, (products) {
      this.products = products;
      emit(GetFavouritesSuccessState(products));
    });
  }
}
