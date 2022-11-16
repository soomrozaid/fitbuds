part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class InitializeAuth extends AuthEvent {}

class Authenticate extends AuthEvent {
  final bool isNewUser;
  final String? name;
  final String? email;
  final String username;
  final String password;

  Authenticate(
      {required this.username,
      required this.password,
      this.name,
      this.email,
      this.isNewUser = false});
}

class ConfirmCredentials extends AuthEvent {
  final String username;
  final String confirmationCode;

  ConfirmCredentials({required this.username, required this.confirmationCode});
}

class ResentConfirmationCode extends AuthEvent {
  final String username;

  ResentConfirmationCode(this.username);
}

class Unauthenticate extends AuthEvent {}

class ClearUsers extends AuthEvent {}

class ForgetPassword extends AuthEvent {
  final String username;

  ForgetPassword(this.username);
}

class ResetPasswordVerification extends AuthEvent {
  final String username;
  final String password;
  final String verificationCode;

  ResetPasswordVerification({
    required this.username,
    required this.password,
    required this.verificationCode,
  });
}

class ListUsers extends AuthEvent {}
