part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final User user;

  AuthenticatedState(this.user);
}

class UnauthenticatedState extends AuthState {
  final String? error;

  UnauthenticatedState({this.error});
}

class ConfirmCredentialsState extends AuthState {
  final String username;

  ConfirmCredentialsState(this.username);
}

class ResetPasswordState extends AuthState {
  final String? username;

  ResetPasswordState({this.username});
}

class LoadingState extends AuthState {}
