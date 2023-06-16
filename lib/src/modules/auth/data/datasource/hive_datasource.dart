import 'package:izam/src/modules/auth/domain/entities/user_entity.dart';

import '../../../../core/Sql/hive_boxes.dart';

class HiveDataSource {
  Future<UserEntity> addItem(String email, String pass) async {
    final user = UserEntity()
      ..email = email
      ..password = pass
      ..counter = 1;
    final box = Boxes.getUserBox();
    box.add(user);
    return user;
  }

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

  bool queryItem(UserEntity entity) {
    final box = Boxes.getUserBox();
    bool contains = box.containsKey(entity.key);
    return contains;
  }

  List<UserEntity> getUsers() {
    final box = Boxes.getUserBox();
    final users = box.values.toList().cast<UserEntity>();
    return users;
  }

  void deleteItem(UserEntity user) => user.delete();
}
