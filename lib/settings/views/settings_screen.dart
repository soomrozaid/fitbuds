import 'package:fitbuds/auth/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext _) => AlertDialog(
                            title: const Text(
                                "Are you sure, you want to log out?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context
                                        .read<AuthBloc>()
                                        .add(Unauthenticate());
                                  },
                                  child: const Text("Logout"))
                            ],
                          )),
                  child: const Text("Logout"))
            ],
          ),
        ),
      )),
    );
  }
}
