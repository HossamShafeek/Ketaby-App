import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/books_model/books_model.dart';
import 'package:ketaby/feature/home/data/models/categories_model/categories_model.dart';
import 'package:ketaby/feature/home/data/models/sliders_model/sliders_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, SlidersModel>> getSliders();
  Future<Either<Failure, BooksModel>> getBestSeller();
  Future<Either<Failure, BooksModel>> getNewArrivals();
  Future<Either<Failure, CategoriesModel>> getCategories();
}
