import 'package:hive_flutter/hive_flutter.dart';

import 'base_user.dart';
part 'user_entity.g.dart';

// Generate ID Automatically which represents the  foreign key
@HiveType(typeId: 1, adapterName: 'UserAdapter')
class UserEntity extends HiveObject with BaseUser {
  @HiveField(0)
  late String email;
  @HiveField(1)
  late String password;
  // Dividend attribute
  @HiveField(2, defaultValue: 0)
  late int counter;
}
