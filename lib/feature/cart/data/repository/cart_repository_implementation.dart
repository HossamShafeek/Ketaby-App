import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketaby/core/api/api_services.dart';
import 'package:ketaby/core/api/end_points.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';
import 'package:ketaby/feature/cart/data/models/cart_model/cart_model.dart';

class CartRepositoryImplementation extends CartRepository {
  final ApiServices apiServices;

  CartRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      Response response = await apiServices.get(
        endPoint: EndPoints.getCart,
        token: AppConstants.token,
      );
      return Right(CartModel.fromJson(response.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> addToCart({required String bookId}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.addToCart,
        token: AppConstants.token,
        data: {
          'product_id': bookId,
        },
      );
      return Right(CartModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> updateCart(
      {required String bookId, required String quantity}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.updateCart,
        token: AppConstants.token,
        data: {
          'cart_item_id': bookId,
          'quantity': quantity,
        },
      );
      return Right(CartModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> removeFromCart(
      {required String bookId}) async {
    try {
      Response data = await apiServices.post(
        endPoint: EndPoints.removeFromCart,
        token: AppConstants.token,
        data: {
          'cart_item_id': bookId,
        },
      );
      return Right(CartModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
