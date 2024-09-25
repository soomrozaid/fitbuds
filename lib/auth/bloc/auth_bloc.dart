import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:fitbuds/models/User.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authRepo;
  final UserRepository _userRepo;

  AuthBloc(this._authRepo, this._userRepo) : super(AuthInitial()) {
    on<InitializeAuth>(_onInitializeAuthentication);

    on<Authenticate>(_onAuthenticate);

    on<ConfirmCredentials>(_onConfirmCredentials);

    on<ResentConfirmationCode>(_onResentConfirmationCode);

    on<Unauthenticate>(_onUnAuthenticate);

    on<ForgetPassword>(_onForgetPassword);

    on<ResetPasswordVerification>(_onResetPasswordVerification);

    // on<ClearUsers>(_onClearUsers);
  }

  Future<void> _getUserAndEmitState(Emitter emit) async {
    User? user = await _userRepo.getUser();

    if (user is! User) {
      emit(UnauthenticatedState(error: "User does not exist in our records"));
      return;
    }

    emit(AuthenticatedState(user));
    return;
  }

  Future<void> _onInitializeAuthentication(
      AuthEvent event, Emitter emit) async {
    emit(LoadingState());
    bool _isAuthenticated = await _authRepo.initializeAuthentication();
    if (!_isAuthenticated) {
      emit(UnauthenticatedState());
      return;
    }

    await _getUserAndEmitState(emit);
    return;
  }

  Future<void> _onAuthenticate(Authenticate event, emit) async {
    emit(LoadingState());

    if (event.isNewUser) {
      if (event.email is! String && event.name is! String) {
        emit(UnauthenticatedState(
            error: "Name and Email are required to signup"));
        return;
      }

      AuthNextSignUpStep? nextSignUpStep =
          await _authRepo.createUserWithEmailAndPassword(
              username: event.username,
              email: event.email!,
              password: event.password,
              name: event.name!);

      if (nextSignUpStep is! AuthNextSignUpStep) {
        emit(UnauthenticatedState(
            error:
                "Error occured while sending the confirmation code. Please make sure the email you provided is valid and active."));
        return;
      }

      emit(ConfirmCredentialsState(
          username: event.username, email: event.email!));
      return;
    }

    String _authResponse = await _authRepo.signInWithUsernameAndPassword(
        username: event.username, password: event.password);

    switch (_authResponse) {
      case "authenticated":
        await _getUserAndEmitState(emit);
        return;
      case "needConfirmationCode":
        emit(ConfirmCredentialsState(
            username: event.username, email: event.email!));
        return;
      case "userNotFound":
        emit(UnauthenticatedState(
            error: "Username does not exist in our record", newUser: true));
        return;
      case "Exception":
      default:
        emit(UnauthenticatedState(error: "Unexpected error occured"));
        return;
    }
  }

  Future<void> _onConfirmCredentials(ConfirmCredentials event, emit) async {
    emit(LoadingState());

    bool _authResponse = await _authRepo.confirmSignUp(
        username: event.username, confirmationCode: event.confirmationCode);

    if (!_authResponse) {
      emit(UnauthenticatedState(
          error: "Confirmation Code wasn't accepted. Please try again.",
          username: event.username));
      return;
    }

    User? _user = await _userRepo.createNewUser(
      username: event.username,
      email: event.email,
    );

    if (_user is! User) {
      emit(UnauthenticatedState(
          error: "Error while creating a new user record."));
      return;
    }

    emit(AuthenticatedState(_user));
    return;
  }

  Future<void> _onResentConfirmationCode(event, emit) async {
    emit(LoadingState());

    await _authRepo.resendConfirmationCode(event.username);

    emit(ConfirmCredentialsState(username: event.username, email: event.email));
    return;
  }

  Future<void> _onUnAuthenticate(event, emit) async {
    await _authRepo.signOut;
    emit(UnauthenticatedState());
    return;
  }

  Future<void> _onForgetPassword(event, emit) async {
    emit(LoadingState());
    String? response = await _authRepo.forgotPassword(event.username);
    if (response is String) return emit(UnauthenticatedState(error: response));
    emit(ResetPasswordState(username: event.username));
    return;
  }

  Future<void> _onResetPasswordVerification(
      ResetPasswordVerification event, emit) async {
    emit(LoadingState());
    bool _response = await _authRepo.resetPasswordVerification(
      username: event.username,
      password: event.password,
      verificationCode: event.verificationCode,
    );
    if (!_response) {
      return emit(UnauthenticatedState(
          error: "Sorry, verification code was not acccepted."));
    }
    Authenticate authEvent = Authenticate(
        username: event.username, password: event.password, isNewUser: false);
    _onAuthenticate(authEvent, emit);
    return;
  }

  // Future<void> _onClearUsers(event, emit) async {
  //   emit(LoadingState());
  //   AuthDebugger _debugger = await _authRepo.clearUsersData();
  //   print(_debugger.message);
  //   emit(UnauthenticatedState(error: _debugger.error));
  // }
}
