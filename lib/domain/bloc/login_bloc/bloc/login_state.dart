part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginFailureState extends LoginState {}
