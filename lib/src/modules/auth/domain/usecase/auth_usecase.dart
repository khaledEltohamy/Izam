import 'package:dartz/dartz.dart';
import 'package:izam/src/core/errors/failure.dart';
import 'package:izam/src/modules/auth/domain/entities/user_entity.dart';
import 'package:izam/src/modules/auth/domain/repository/auth_repository.dart';

class UseCaseAuth {
  final AuthRepository authRepository;

  UseCaseAuth(this.authRepository);

  Future<Either<Failure, UserEntity>> login(String email, String pass) =>
      authRepository.login(email, pass);
}
