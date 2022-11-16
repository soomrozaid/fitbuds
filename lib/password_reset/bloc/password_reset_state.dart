part of 'password_reset_bloc.dart';

class PasswordResetState {
  final String? username;
  final String? password;
  final String? verificationCode;

  PasswordResetState._(
      {this.username = '', this.password = '', this.verificationCode = ''});

  factory PasswordResetState.initial(
      ) => PasswordResetState._();

  PasswordResetState copyWith(
          {String? username, String? password, String? verificationCode}) =>
      PasswordResetState._(
        username: username,
        password: password,
        verificationCode: verificationCode,
      );
}
