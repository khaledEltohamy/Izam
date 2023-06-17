import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../modules/auth/domain/entities/user_entity_sql.dart';

class SqfliteDatabase {
  static final SqfliteDatabase instance = SqfliteDatabase._init();

  static Database? _database;

  SqfliteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
 CREATE TABLE $tableUsers ( 
   ${UserFields.id} $idType, 
   ${UserFields.counter} $integerType,
   ${UserFields.password} $textType,
   ${UserFields.email} $textType
   )
''');
  }

  Future<UserSql> create(UserSql user) async {
    final db = await instance.database;
    final id = await db.insert(tableUsers, user.toJson());
    return user.copy(id: id);
  }

  Future<UserSql> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UserSql.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<UserSql>> readAllUsers() async {
    final db = await instance.database;

    final orderBy = '${UserFields.counter}';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableUsers, orderBy: orderBy);

    return result.map((json) => UserSql.fromJson(json)).toList();
  }

  Future<int> update(UserSql user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
