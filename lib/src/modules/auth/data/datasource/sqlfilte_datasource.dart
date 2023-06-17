import 'package:izam/src/modules/auth/data/datasource/base_local_datasource.dart';
import '../../../../core/DataBase/sqlfite_database.dart';
import '../../domain/entities/base_user.dart';
import '../../domain/entities/user_entity_sql.dart';

class SqfliteDataSource extends BaseLocalDataSource {
  @override
  Future<UserSql> editItem(
    BaseUser userArg,
    String email,
    String pass,
    int counter,
  ) async {
    userArg as UserSql;
    final user = userArg.copy(
      email: email,
      password: pass,
      counter: counter,
    );

    await SqfliteDatabase.instance.update(user);
    return user;
  }

  @override
  Future<UserSql> addItem(String email, String pass) async {
    final user = UserSql(
      counter: 1,
      email: email,
      password: pass,
    );

    await SqfliteDatabase.instance.create(user);
    return user;
  }

  @override
  Future<UserSql?> queryItem(BaseUser entity) async {
    final user = await SqfliteDatabase.instance.readUser(entity.id!);
    return user;
  }

  @override
  void deleteItem(BaseUser user) async {
    await SqfliteDatabase.instance.delete(user.id!);
  }

  @override
  Future<List<UserSql>> getUsers() async {
    final result = await SqfliteDatabase.instance.readAllUsers();
    return result;
  }

  @override
  List<Object?> get props => [];
}
