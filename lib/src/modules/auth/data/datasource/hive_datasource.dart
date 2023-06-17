import 'package:izam/src/modules/auth/domain/entities/base_user.dart';

import '../../../../core/Database/hive_boxes.dart';
import '../../domain/entities/user_entity.dart';
import 'base_local_datasource.dart';

class HiveDataSource extends BaseLocalDataSource {
  @override
  Future<UserEntity> addItem(String email, String pass) async {
    final user = UserEntity()
      ..email = email
      ..password = pass
      ..counter = 1;
    final box = Boxes.getUserBox();
    box.add(user);
    return user;
  }

  @override
  Future<UserEntity> editItem(
    BaseUser user,
    String email,
    String pass,
    int counter,
  ) async {
    user as UserEntity;
    user.email = email;
    user.password = pass;
    user.counter = counter;
    await user.save();
    return user;
  }

  @override
  Future<UserEntity?> queryItem(BaseUser entity) async {
    entity as UserEntity;
    final box = Boxes.getUserBox();
    bool contains = box.containsKey(entity.key);
    if (contains) {
      return entity;
    } else {
      return null;
    }
  }

  @override
  Future<List<UserEntity>> getUsers() {
    final box = Boxes.getUserBox();
    final users = box.values.toList().cast<UserEntity>();
    return Future.value(users);
  }

  @override
  void deleteItem(BaseUser user) {
    user as UserEntity;
    user.delete();
  }

  @override
  List<Object?> get props => [];
}
