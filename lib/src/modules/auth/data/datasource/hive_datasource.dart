import 'package:izam/src/modules/auth/domain/entities/user_entity.dart';

import '../../../../core/Sql/hive_boxes.dart';
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
    UserEntity user,
    String email,
    String pass,
    int counter,
  ) async {
    user.email = email;
    user.password = pass;
    user.counter = counter;
    await user.save();
    return user;
  }

  @override
  bool queryItem(UserEntity entity) {
    final box = Boxes.getUserBox();
    bool contains = box.containsKey(entity.key);
    return contains;
  }

  @override
  List<UserEntity> getUsers() {
    final box = Boxes.getUserBox();
    final users = box.values.toList().cast<UserEntity>();
    return users;
  }

  @override
  void deleteItem(UserEntity user) => user.delete();

  @override
  List<Object?> get props => [];
}
