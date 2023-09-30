import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/books_model/books_model.dart';
import 'package:ketaby/feature/home/data/repository/home_repository.dart';
import 'package:ketaby/feature/home/presentation/cubits/best_seller_cubit/best_seller_state.dart';


class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepository) : super(BestSellerInitial());

  final HomeRepository homeRepository;

  static BestSellerCubit get(context) => BlocProvider.of(context);

  BooksModel? bestSellerModel;

  Future<void> getBestSeller() async {
    emit(BestSellerLoadingState());
    Either<Failure, BooksModel> result;
    result = await homeRepository.getBestSeller();
    result.fold((failure) {
      emit(BestSellerFailureState(failure.error));
    }, (bestsellerModel) {
      this.bestSellerModel = bestsellerModel;
      emit(BestSellerSuccessState(bestsellerModel));
    });
  }
}
