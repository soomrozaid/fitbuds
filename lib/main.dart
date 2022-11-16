import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:fitbuds/amplifyconfiguration.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:fitbuds/confirmation/confirmation.dart';
import 'package:fitbuds/loading/loading.dart';
import 'package:fitbuds/login/login.dart';
import 'package:fitbuds/home/home.dart';
import 'package:fitbuds/password_reset/password_reset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  // Bloc.observer = AuthObserver();
  // Bloc.observer = LoginObserver();
  runApp(App());
}

class App extends MaterialApp {
  const App({Key? key})
      : super(
            key: key, debugShowCheckedModeBanner: false, home: const AppView());
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  bool _isLoading = true;

  @override
  void initState() {
    _initializeApp();

    super.initState();
  }

  Future<void> _initializeApp() async {
    await _configure();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configure() async {
    await Amplify.addPlugins(<AmplifyPluginInterface>[AmplifyAuthCognito()]);

    await Amplify.configure(amplifyconfig);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      return RepositoryProvider(
          create: (context) => AuthenticationRepository.amplify(Amplify),
          child: const BlocWrapper());
    }
    return const LoadingView();
  }
}

class BlocWrapper extends StatelessWidget {
  const BlocWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
        create: (BuildContext context) =>
            AuthBloc(context.read<AuthenticationRepository>())..add(InitializeAuth()),
      ),
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
      BlocProvider<ConfirmationBloc>(
        create: (BuildContext context) => ConfirmationBloc(),
      ),
      BlocProvider<PasswordResetBloc>(
        create: (BuildContext context) => PasswordResetBloc(),
      )
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
        } else if (state is LoadingState) {
          return const LoadingView();
        } else if (state is ConfirmCredentialsState) {
          return ConfirmationView(username: state.username);
        } else if (state is ResetPasswordState) {
          return PasswordResetScreen(username: state.username,);
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
