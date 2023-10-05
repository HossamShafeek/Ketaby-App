import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';
import 'package:ketaby/feature/cart/data/models/cart_model/cart_model.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this.cartRepository) : super(GetCartInitialState());

  static GetCartCubit get(BuildContext context) => BlocProvider.of(context);

  final CartRepository cartRepository;

  CartModel? cartModel;
  List<int> cartId =[];

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    Either<Failure, CartModel> result;
    result = await cartRepository.getCart();
    result.fold(
      (failure) {
        emit(GetCartFailureState(failure.error));
      },
      (cartModel) {
        this.cartModel = cartModel;
        cartModel.data!.cartItems!.map((book) {
          cartId.add(book.itemId!.toInt());
        });
        emit(GetCartSuccessState());
      },
    );
  }
}
