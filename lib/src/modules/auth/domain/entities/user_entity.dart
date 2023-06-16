import 'package:hive_flutter/hive_flutter.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 1, adapterName: 'UserAdapter')
class UserEntity extends HiveObject {
  @HiveField(0)
  late String email;
  @HiveField(1)
  late String password;
  @HiveField(2, defaultValue: 0)
  late int counter;
}
