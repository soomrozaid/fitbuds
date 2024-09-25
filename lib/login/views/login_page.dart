import 'package:fitbuds/login/login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String? errorMessage;
  final bool? newUser;
  final String? username;
  const LoginPage({Key? key, this.errorMessage, this.newUser, this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginView(
      errorMessage: errorMessage,
      newUser: newUser,
      username: username,
    );
  }
}
