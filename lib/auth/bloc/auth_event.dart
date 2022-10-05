part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Authenticate extends AuthEvent {
  final bool isNewUser;
  final String? name;
  final String? email;
  final String username;
  final String password;

  Authenticate(
      {required this.username, required this.password, this.name, this.email, this.isNewUser = false});
}

class Unauthenticate extends AuthEvent {}
