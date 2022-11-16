import 'package:fitbuds/auth/auth.dart';
import 'package:fitbuds/confirmation/bloc/confirmation_bloc.dart';
import 'package:fitbuds/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationView extends StatelessWidget {
  final String username;

  ConfirmationView({Key? key, required this.username}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FitTextField(
            controller: _controller,
            hintText: 'Confirmation Code',
            onChanged: (value) => BlocProvider.of<ConfirmationBloc>(context)
                .add(ChangeConfirmationCode(value)),
            focusNode: _focusNode,
          ),
          FitButton.text(
            text: 'Resend the code',
              onPressed: () => BlocProvider.of<AuthBloc>(context)
                  .add(ResentConfirmationCode(username))),
          FitButton(
              text: 'Submit',
              onPressed: () => BlocProvider.of<AuthBloc>(context).add(
                  ConfirmCredentials(
                      username: username, confirmationCode: _controller.text)))
        ],
      )),
    );
  }
}
