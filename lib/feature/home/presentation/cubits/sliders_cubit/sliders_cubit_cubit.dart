import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/sliders_model/sliders_model.dart';
import 'package:ketaby/feature/home/data/repository/home_repository.dart';

part 'sliders_cubit_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit(this.homeRepository) : super(SlidersInitial());
  final HomeRepository homeRepository;

  static SlidersCubit get(context) => BlocProvider.of(context);

  SlidersModel? slidersModel;

  Future<void> getSliders() async {
    emit(SlidersLoadingState());
    Either<Failure, SlidersModel> result;
    result = await homeRepository.getSliders();
    result.fold((failure) {
      emit(SlidersFailureState(failure.error));
    }, (slidersModel) {
      this.slidersModel = slidersModel;
      emit(SlidersSuccessState(slidersModel));
    });
  }
}
