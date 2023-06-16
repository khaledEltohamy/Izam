import 'package:equatable/equatable.dart';
import 'package:izam/src/core/errors/failure.dart';
import 'package:izam/src/modules/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository extends Equatable {
  Future<Either<Failure, UserEntity>> login(String email, String pass);
}
