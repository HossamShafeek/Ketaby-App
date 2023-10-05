import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';
import 'package:ketaby/feature/cart/data/models/cart_model/cart_model.dart';
import 'package:ketaby/feature/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.cartRepository) : super(AddToCartInitialState());

  static AddToCartCubit get(BuildContext context) => BlocProvider.of(context);

  final CartRepository cartRepository;

  Future<void> addToCart(
      {required String bookId, required BuildContext context}) async {
    emit(AddToCartLoadingState());
    Either<Failure, CartModel> result;
    result = await cartRepository.addToCart(bookId: bookId);
    result.fold(
      (failure) {
        showErrorSnackBar(context: context, message: failure.error);
        emit(AddToCartFailureState(failure.error));
      },
      (cartModel) {
        showSuccessSnackBar(context: context, message: cartModel.message!);
        emit(AddToCartSuccessState());
      },
    );
  }
}
