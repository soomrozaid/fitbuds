import 'package:fitbuds/auth/auth.dart';
import 'package:fitbuds/auth/bloc/auth_bloc.dart';
import 'package:fitbuds/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  final String? errorMessage;
  final bool? newUser;
  final String? username;
  const LoginView({
    Key? key,
    this.errorMessage,
    this.newUser,
    this.username,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();

  final FocusNode _usernameFocusNode = FocusNode();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _nameController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

  bool _showPassword = false;

  bool isNewUser = false;
  String? error;

  @override
  void initState() {
    error = widget.errorMessage;
    isNewUser = widget.newUser ?? false;
    _usernameController.text = widget.username ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isNewUser) ...[
                    FitTextField(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      prefixIconData: Icons.badge,
                      hintText: "Name",
                    ),
                    FitTextField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      prefixIconData: Icons.mail,
                      hintText: "Email",
                    ),
                  ],
                  FitTextField(
                    controller: _usernameController,
                    focusNode: _usernameFocusNode,
                    prefixIconData: Icons.person,
                    hintText: "Username",
                  ),
                  FitTextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    prefixIconData: Icons.lock,
                    obscureText: !_showPassword,
                    hintText: "Password",
                    onTogglePasswordVisibility: () =>
                        setState(() => _showPassword = !_showPassword),
                  ),
                  TextButton(
                      onPressed: _onForgotPassword,
                      child: const Text("Forgot Password?")),
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.deepOrange),
                      ),
                      onPressed: _onAuthenticate,
                      child: Text(
                        isNewUser ? "Signup" : "Login",
                        style: const TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () => setState(() => isNewUser = !isNewUser),
                      child: Text(isNewUser ? "Login" : "Signup")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onAuthenticate() {
    String name = _nameController.text.isEmpty ? "Zaid" : _nameController.text;
    String email = _emailController.text.isEmpty
        ? "soomrozaid@gmail.com"
        : _emailController.text;
    String username =
        _usernameController.text.isEmpty ? "zaid" : _usernameController.text;
    String password = _passwordController.text.isEmpty
        ? "PresetPass!0"
        : _passwordController.text;

    context.read<AuthBloc>().add(Authenticate(
        username: username,
        password: password,
        name: name,
        email: email,
        isNewUser: isNewUser));
  }

  void _onForgotPassword() {
    _usernameController.text.isEmpty
        ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Please make sure the username field is not blank")))
        : context
            .read<AuthBloc>()
            .add(ForgetPassword(_usernameController.text.trim()));
  }
}
