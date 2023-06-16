import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

abstract class BaseLocalDataSource extends Equatable {
  Future<UserEntity> addItem(String email, String pass);
  Future<UserEntity> editItem(
    UserEntity user,
    String email,
    String pass,
    int counter,
  );
  bool queryItem(UserEntity entity);
  List<UserEntity> getUsers();
  void deleteItem(UserEntity user);
}
