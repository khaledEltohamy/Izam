import 'package:izam/src/core/validation/validations.dart';
import 'package:izam/src/modules/auth/data/datasource/hive_datasource.dart';
import 'package:izam/src/modules/auth/data/datasource/sqlfilte_datasource.dart';
import 'package:izam/src/modules/auth/domain/entities/base_user.dart';
import 'package:izam/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:izam/src/modules/auth/domain/repository/auth_repository.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/entities/user_entity_sql.dart';

class ImpAuthRepository extends AuthRepository with Validations {
  final HiveDataSource localDataSource;
  final SqfliteDataSource sqlfliteDataSource;
  ImpAuthRepository(this.localDataSource, this.sqlfliteDataSource);

  // USING HIVE DATABASE
  @override
  Future<Either<Failure, BaseUser>> login(String email, String pass) async {
    String? emailVal = Validations.validateEmail(email);
    String? passVal = Validations.validatePassword(pass);
    if (emailVal == null && passVal == null) {
      List<UserEntity> users = await localDataSource.getUsers();
      var checkAssignUser = users.isEmpty
          ? []
          : users
              .where((element) =>
                  element.email == email && element.password == pass)
              .toList();
      if (checkAssignUser.isNotEmpty) {
        try {
          UserEntity user = await localDataSource.editItem(
              checkAssignUser[0], email, pass, checkAssignUser[0].counter + 1);
          return Right(user);
        } catch (e) {
          return Left(FailureServiceWithResponse(error: e.toString()));
        }
      } else {
        try {
          UserEntity user = await localDataSource.addItem(email, pass);
          return Right(user);
        } catch (e) {
          return Left(FailureServiceWithResponse(error: e.toString()));
        }
      }
    } else {
      emailVal = emailVal ?? "";
      passVal = passVal ?? "";
      return Left(FailureServiceValidation(
          error: "Validation : \n $emailVal \n $passVal"));
    }
  }

  // USING SQFLITE DATABASE
  @override
  Future<Either<Failure, BaseUser>> loginSql(String email, String pass) async {
    String? emailVal = Validations.validateEmail(email);
    String? passVal = Validations.validatePassword(pass);
    if (emailVal == null && passVal == null) {
      List<UserSql> users = await sqlfliteDataSource.getUsers();
      var checkAssignUser = users.isEmpty
          ? []
          : users
              .where((element) =>
                  element.email == email && element.password == pass)
              .toList();
      if (checkAssignUser.isNotEmpty) {
        try {
          UserSql user = await sqlfliteDataSource.editItem(
              checkAssignUser[0], email, pass, checkAssignUser[0].counter + 1);
          return Right(user);
        } catch (e) {
          return Left(FailureServiceWithResponse(error: e.toString()));
        }
      } else {
        try {
          UserSql user = await sqlfliteDataSource.addItem(email, pass);
          return Right(user);
        } catch (e) {
          return Left(FailureServiceWithResponse(error: e.toString()));
        }
      }
    } else {
      emailVal = emailVal ?? "";
      passVal = passVal ?? "";
      return Left(FailureServiceValidation(
          error: "Validation : \n $emailVal \n $passVal"));
    }
  }

  @override
  List<Object?> get props => [];
}
