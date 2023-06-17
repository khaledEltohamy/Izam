import 'package:dartz/dartz.dart';
import 'package:izam/src/core/errors/failure.dart';
import 'package:izam/src/modules/auth/domain/entities/base_user.dart';
import 'package:izam/src/modules/auth/domain/repository/auth_repository.dart';

class UseCaseAuth {
  final AuthRepository authRepository;

  UseCaseAuth(this.authRepository);

  Future<Either<Failure, BaseUser>> login(String email, String pass) =>
      authRepository.login(email, pass);

  Future<Either<Failure, BaseUser>> loginSql(String email, String pass) =>
      authRepository.loginSql(email, pass);
}
