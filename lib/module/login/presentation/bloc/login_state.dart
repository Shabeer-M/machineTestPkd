part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  final bool isLogged;

  LoginSuccess({
    required this.message,
    required this.isLogged,
  });
}

class LoginFailure extends LoginState {
  final String error;
  final bool isFailed;

  LoginFailure({
    required this.error,
    required this.isFailed,
  });
}
