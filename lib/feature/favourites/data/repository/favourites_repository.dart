import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';

abstract class FavouritesRepository {
  Future<Either<ServerFailure, List<Product>>> getFavourites();
  Future<Either<ServerFailure, List<Product>>> addToFavourites(
      {required String bookId});
  Future<Either<ServerFailure, List<Product>>> removeToFavourites(
      {required String bookId});
}
