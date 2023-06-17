import 'package:get_it/get_it.dart';
import 'package:izam/src/modules/auth/data/datasource/base_local_datasource.dart';
import 'package:izam/src/modules/auth/data/datasource/hive_datasource.dart';
import 'package:izam/src/modules/auth/data/datasource/sqlfilte_datasource.dart';
import 'package:izam/src/modules/auth/data/repository/imp_auth_repository.dart';
import 'package:izam/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:izam/src/modules/auth/domain/usecase/auth_usecase.dart';
import 'package:izam/src/modules/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../validation/cubit/visible_password_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//DataSource
  getIt.registerLazySingleton<HiveDataSource>(() => HiveDataSource());
  getIt.registerLazySingleton<SqfliteDataSource>(() => SqfliteDataSource());
//Repositories
  getIt.registerLazySingleton<AuthRepository>(
      () => ImpAuthRepository(getIt(), getIt()));
//UseCases
  getIt.registerLazySingleton<UseCaseAuth>(() => UseCaseAuth(getIt()));
//Cubits - Blocs - View Models
  getIt.registerFactory(() => AuthBloc(getIt()));
  getIt.registerFactory(() => VisiblePasswordCubit());
}
