import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/books_model/books_model.dart';
import 'package:ketaby/feature/home/data/repository/home_repository.dart';
import 'package:ketaby/feature/home/presentation/cubits/new_arrivals_cubit/new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit(this.homeRepository) : super(NewArrivalsInitial());

  final HomeRepository homeRepository;

  static NewArrivalsCubit get(context) => BlocProvider.of(context);

  BooksModel? booksModel;

  Future<void> getNewArrivals() async {
    emit(NewArrivalsLoadingState());
    Either<Failure, BooksModel> result;
    result = await homeRepository.getNewArrivals();
    result.fold((failure) {
      emit(NewArrivalsFailureState(failure.error));
    }, (booksModel) {
      this.booksModel = booksModel;
      emit(NewArrivalsSuccessState(booksModel));
    });
  }
}
