import 'package:dartz/dartz.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/profile/data/model/profile_model.dart';


abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getUserProfile();
}
