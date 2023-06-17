// class Boxes {
//   static Box<Transaction> getTransactions() =>
//       Hive.box<Transaction>('transactions');
// }
import 'package:hive_flutter/hive_flutter.dart';
import 'package:izam/src/modules/auth/domain/entities/user_entity.dart';
import 'package:izam/src/utils/constant/strings.dart';

class Boxes {
  static Box<UserEntity> getUserBox() => Hive.box<UserEntity>("".dbName());
}
