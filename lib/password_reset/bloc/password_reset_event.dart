part of 'password_reset_bloc.dart';

@immutable
abstract class PasswordResetEvent {}

class ChangePasswordResetValues extends PasswordResetEvent {
  final String? username;
  final String? password;
  final String? verificationCode;

  ChangePasswordResetValues(
      {this.username, this.password, this.verificationCode});
}
