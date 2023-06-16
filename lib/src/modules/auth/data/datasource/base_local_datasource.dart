import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

abstract class BaseLocalDataSource extends Equatable {
  insertItem(UserEntity user);
  updateItem();
  getItem();
  deleteItem();
}
