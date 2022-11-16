import 'package:fitbuds/auth/auth.dart';
import 'package:fitbuds/password_reset/bloc/password_reset_bloc.dart';
import 'package:fitbuds/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordResetScreen extends StatelessWidget {
  final String? username;
  PasswordResetScreen({Key? key, this.username}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _verificationCodeController =
      TextEditingController();
  final FocusNode _verificationCodeFocusNode = FocusNode();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _usernameController.text = username ?? '',
    );
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FitTextField(
              controller: _usernameController,
              focusNode: _usernameFocusNode,
              onChanged: (value) => BlocProvider.of<PasswordResetBloc>(context)
                  .add(ChangePasswordResetValues(username: value)),
              hintText: 'Username',
            ),
            FitTextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              onChanged: (value) => BlocProvider.of<PasswordResetBloc>(context)
                  .add(ChangePasswordResetValues(password: value)),
              hintText: 'New Password',
            ),
            FitTextField(
              controller: _verificationCodeController,
              focusNode: _verificationCodeFocusNode,
              onChanged: (value) => BlocProvider.of<PasswordResetBloc>(context)
                  .add(ChangePasswordResetValues(verificationCode: value)),
              hintText: 'Verification Code',
            ),
            FitButton.text(
              onPressed: () {
                if (_usernameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const FitText(
                        'Username cannot be empty',
                        fontSize: 20,
                      ),
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.white,
                        onPressed: () =>
                            _scaffoldKey.currentState?.clearSnackBars(),
                      ),
                    ),
                  );
                } else {
                  BlocProvider.of<AuthBloc>(context)
                      .add(ForgetPassword(_usernameController.text));
                }
              },
              text: 'Resend verification code',
            ),
            FitButton(
              onPressed: () {
                if (_usernameController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _verificationCodeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const FitText(
                        'Please fill out all of the field before submitting',
                        fontSize: 20,
                      ),
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.white,
                        onPressed: () =>
                            _scaffoldKey.currentState?.clearSnackBars(),
                      ),
                    ),
                  );
                } else {
                  BlocProvider.of<AuthBloc>(context).add(
                    ResetPasswordVerification(
                      username: _usernameController.text,
                      password: _passwordController.text,
                      verificationCode: _verificationCodeController.text,
                    ),
                  );
                }
              },
              text: 'Submit',
            )
          ],
        ),
      ),
    );
  }
}
