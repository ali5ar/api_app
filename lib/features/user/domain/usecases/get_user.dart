import 'package:api_app/core/errors/failure.dart';
import 'package:api_app/core/params/params.dart';
import 'package:api_app/features/user/domain/entities/user_entity.dart';
import 'package:api_app/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final UserRepository repository;
  Future<Either<Failure, UserEntity>> call({required UserParams params}) {
    return repository.getUser(params: params);
  }

  GetUser({required this.repository});
}