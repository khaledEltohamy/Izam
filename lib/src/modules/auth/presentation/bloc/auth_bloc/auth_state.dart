part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final BaseUser userEntity;

  const LoginSuccess(this.userEntity);
}

class LoginField extends AuthState {
  final ErrorModel errorModel;
  const LoginField(this.errorModel);
}

class LoginLoading extends AuthState {}
