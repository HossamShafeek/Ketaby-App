import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/cart/data/models/cart_model/cart_model.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel>> getCart();

  Future<Either<Failure, CartModel>> addToCart({required String bookId});

  Future<Either<Failure, CartModel>> updateCart(
      {required String bookId, required String quantity});

  Future<Either<Failure, CartModel>> removeFromCart({required String bookId});
}
