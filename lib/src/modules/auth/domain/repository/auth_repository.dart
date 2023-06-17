import 'package:equatable/equatable.dart';
import 'package:izam/src/core/errors/failure.dart';
import 'package:izam/src/modules/auth/domain/entities/base_user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository extends Equatable {
  Future<Either<Failure, BaseUser>> login(String email, String pass);
  Future<Either<Failure, BaseUser>> loginSql(String email, String pass);
}
