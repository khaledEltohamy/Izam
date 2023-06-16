import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:izam/src/config/theme/theme_app.dart';
import 'package:izam/src/core/injection/core_injection.dart' as di;
import 'package:izam/src/core/validation/cubit/visible_password_cubit.dart';
import 'package:izam/src/modules/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:izam/src/utils/constant/strings.dart';
import 'package:path_provider/path_provider.dart';

import 'src/modules/auth/domain/entities/user_entity.dart';
import 'src/modules/auth/presentation/view/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init of dependency injection
  await di.init();

  // open Local Table in database with Hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<UserEntity>("".dbName());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<AuthBloc>()),
        BlocProvider(create: (_) => di.getIt<VisiblePasswordCubit>()),
      ],
      child: MaterialApp(
        title: 'IZAM',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: const LoginScreen(),
      ),
    );
  }
}
