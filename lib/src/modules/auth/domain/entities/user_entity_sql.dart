import 'package:izam/src/modules/auth/domain/entities/base_user.dart';

const String tableUsers = 'Users';

class UserFields {
  static final List<String> values = [
    /// Add all fields
    id, email, password, counter
  ];

  static const String id = '_id';
  static const String email = 'email';
  static const String password = 'password';
  static const String counter = 'counter';
}

class UserSql with BaseUser {
  final int? id;
  final int counter;
  final String password;
  final String email;

  UserSql({
    this.id,
    required this.counter,
    required this.password,
    required this.email,
  });

  UserSql copy({
    int? id,
    int? counter,
    String? password,
    String? email,
  }) =>
      UserSql(
        id: id ?? this.id,
        counter: counter ?? this.counter,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  static UserSql fromJson(Map<String, Object?> json) => UserSql(
        id: json[UserFields.id] as int?,
        counter: json[UserFields.counter] as int,
        password: json[UserFields.password] as String,
        email: json[UserFields.email] as String,
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.email: email,
        UserFields.counter: counter,
        UserFields.password: password,
      };
}
