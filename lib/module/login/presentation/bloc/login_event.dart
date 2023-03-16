part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  final String id;

  LoginButtonPressed({
    required this.username,
    required this.password,
    required this.id,
  });
}
