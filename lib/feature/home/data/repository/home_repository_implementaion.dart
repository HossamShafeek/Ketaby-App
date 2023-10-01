import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/home/data/models/books_model/books_model.dart';
import 'package:ketaby/feature/home/data/models/books_model/product.dart';
import 'package:ketaby/feature/home/data/models/categories_model/categories_model.dart';
import 'package:ketaby/feature/home/data/models/sliders_model/sliders_model.dart';

import 'home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final ApiServices apiServices;

  HomeRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, SlidersModel>>
      getSliders() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.sliders,
        token: AppConstants.token,
      );
      return Right(SlidersModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BooksModel>> getBestSeller() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.bestseller,
        token: AppConstants.token,
      );
      return Right(BooksModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BooksModel>> getNewArrivals() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.newArrivals,
        token: AppConstants.token,
      );
      return Right(BooksModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.categories,
        token: AppConstants.token,
      );
      return Right(CategoriesModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getBooks() async{
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.products,
        token: AppConstants.token,
      );
      return Right((data.data['data']['products'] as List<dynamic>).map((product){
        return Product.fromJson(product);
      }).toList());
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  }
