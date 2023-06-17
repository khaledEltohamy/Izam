import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam/src/core/errors/error_model.dart';
import 'package:izam/src/modules/auth/domain/entities/base_user.dart';
import 'package:izam/src/modules/auth/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UseCaseAuth useCaseAuth;
  AuthBloc(this.useCaseAuth) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) => _handelLoginEvent(event, emit));
  }

  _handelLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoading());

    /// Using Two types of database.
    // PLEASE CHANGE (login) to (loginSql)
    //login : can use Hive DataBase
    // loginSql : can use Sqflite DataBase

    final result = await useCaseAuth.loginSql(event.email, event.pass);
    result.fold(
        (field) => emit(LoginField(ErrorModel.convertFailureError(field))),
        (success) => emit(LoginSuccess(success)));
  }
}
