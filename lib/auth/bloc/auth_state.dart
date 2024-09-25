part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final User user;

  AuthenticatedState(this.user);
}

class UnauthenticatedState extends AuthState {
  final bool? newUser;
  final String? username;
  final String? error;

  UnauthenticatedState({this.error, this.newUser, this.username});
}

class ConfirmCredentialsState extends AuthState {
  final String username;
  final String email;

  ConfirmCredentialsState({
    required this.username,
    required this.email,
  });
}

class ResetPasswordState extends AuthState {
  final String? username;

  ResetPasswordState({this.username});
}

class LoadingState extends AuthState {}
