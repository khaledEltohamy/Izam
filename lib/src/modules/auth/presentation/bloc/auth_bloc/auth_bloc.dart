import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:izam/src/core/errors/error_model.dart';
import 'package:izam/src/modules/auth/domain/entities/user_entity.dart';
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
    final result = await useCaseAuth.login(event.email, event.pass);
    result.fold(
        (field) => emit(LoginField(ErrorModel.convertFailureError(field))),
        (success) => emit(LoginSuccess(success)));
  }
}
