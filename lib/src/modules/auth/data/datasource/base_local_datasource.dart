import 'package:equatable/equatable.dart';
import 'package:izam/src/modules/auth/domain/entities/base_user.dart';

abstract class BaseLocalDataSource extends Equatable {
  Future<BaseUser> addItem(String email, String pass);
  Future<BaseUser> editItem(
    BaseUser user,
    String email,
    String pass,
    int counter,
  );
  Future<BaseUser?> queryItem(BaseUser entity);
  Future<List<BaseUser>> getUsers();
  void deleteItem(BaseUser user);
}
