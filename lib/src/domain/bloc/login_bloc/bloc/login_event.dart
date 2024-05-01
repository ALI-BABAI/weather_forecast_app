part of 'login_bloc.dart';

sealed class LoginEvent {}

class InitEvent extends LoginEvent {}

class CheckLoginEvent extends LoginEvent {
  CheckLoginEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class CreateLoginEvent extends LoginEvent {
  CreateLoginEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
