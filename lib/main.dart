import 'package:authentication_repository/authentication_repository.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:fitbuds/login/login.dart';
import 'package:fitbuds/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  // Bloc.observer = AuthObserver();
  // Bloc.observer = LoginObserver();
  runApp(App());
}

class App extends MaterialApp {
  App({Key? key})
      : super(
            key: key,
            debugShowCheckedModeBanner: false,
            home: RepositoryProvider(
              create: (context) => AuthenticationRepository(),
              child: const AppView(),
            ));
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
        create: (BuildContext context) =>
            AuthBloc(context.read<AuthenticationRepository>()),
      ),
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
    ], child: const AuthWrapper());
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return const HomeScreen();
        } else if (state is UnauthenticatedState) {
          return LoginPage(
            errorMessage: state.error,
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
