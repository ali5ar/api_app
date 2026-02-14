import 'package:api_app/core/errors/failure.dart';
import 'package:api_app/core/params/params.dart';
import 'package:api_app/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}