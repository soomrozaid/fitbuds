import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

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

    on<ClearUsers>(_onClearUsers);
  }

  Future<void> _onInitializeAuthentication(
      AuthEvent event, Emitter emit) async {
    emit(LoadingState());
    AuthResponse _authResponse = await _authRepo.initializeAuthentication();
    if (!_authResponse.isAuthenticated) {
      return emit(UnauthenticatedState(error: _authResponse.error));
    }

    UserResponse _userResponse = await _userRepo.getUser();

    if (!_userResponse.isSuccess) {
      return emit(UnauthenticatedState(error: _userResponse.error));
    }

    if (_userResponse.user == null) {
      return emit(UnauthenticatedState(error: 'User not found'));
    }

    emit(AuthenticatedState(_userResponse.user!));
  }

  Future<void> _onAuthenticate(event, emit) async {
    emit(LoadingState());
    AuthResponse _authResponse;

    // To Create a new user account
    if (event.isNewUser) {
      _authResponse = await _authRepo.createUserWithEmailAndPassword(
        name: event.name!,
        email: event.email!,
        username: event.username,
        password: event.password,
      );

      if (_authResponse.nextStep) {
        return emit(ConfirmCredentialsState(event.username));
      }

      if (!_authResponse.isAuthenticated) {
        return emit(UnauthenticatedState(error: _authResponse.error));
      }

      UserResponse _userResponse = await _userRepo.createNewUser(
          username: event.username, email: event.email);

      if (!_userResponse.isSuccess) {
        return emit(UnauthenticatedState(error: _userResponse.error));
      }

      if (_userResponse.user == null) {
        return emit(UnauthenticatedState(error: 'User not found'));
      }

      emit(AuthenticatedState(_userResponse.user!));
    } else {
      _authResponse = await _authRepo.signInWithEmailAndPassword(
          username: event.username, password: event.password);

      if (_authResponse.nextStep) {
        return emit(ConfirmCredentialsState(event.username));
      }

      if (!_authResponse.isAuthenticated) {
        return emit(UnauthenticatedState(error: _authResponse.error));
      }

      UserResponse _userResponse = await _userRepo.getUser();

      if (!_userResponse.isSuccess) {
        return emit(UnauthenticatedState(error: _userResponse.error));
      }

      if (_userResponse.user == null) {
        return emit(UnauthenticatedState(error: 'User not found'));
      }

      emit(AuthenticatedState(_userResponse.user!));
    }
    print(_authResponse.logs);
  }

  Future<void> _onConfirmCredentials(event, emit) async {
    emit(LoadingState());

    AuthResponse _authResponse = await _authRepo.confirmSignUp(
        username: event.username, confirmationCode: event.confirmationCode);

    if (!_authResponse.isAuthenticated) {
      return emit(UnauthenticatedState(error: _authResponse.error));
    }

    UserResponse _userResponse = await _userRepo.getUser();

    if (!_userResponse.isSuccess) {
      return emit(UnauthenticatedState(error: _userResponse.error));
    }

    if (_userResponse.user == null) {
      return emit(UnauthenticatedState(error: 'User not found'));
    }

    emit(AuthenticatedState(_userResponse.user!));
  }

  Future<void> _onResentConfirmationCode(event, emit) async {
    emit(LoadingState());

    AuthResponse _authResponse =
        await _authRepo.resendConfirmationCode(event.username);

    if (_authResponse.nextStep) {
      return emit(ConfirmCredentialsState(event.username));
    }

    if (!_authResponse.isAuthenticated) {
      return emit(UnauthenticatedState(error: _authResponse.error));
    }

    UserResponse _userResponse = await _userRepo.getUser();

    if (!_userResponse.isSuccess) {
      return emit(UnauthenticatedState(error: _userResponse.error));
    }

    if (_userResponse.user == null) {
      return emit(UnauthenticatedState(error: 'User not found'));
    }

    return emit(AuthenticatedState(_userResponse.user!));
  }

  Future<void> _onUnAuthenticate(event, emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    await _authRepo.signOut();
    emit(UnauthenticatedState());
  }

  Future<void> _onForgetPassword(event, emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    await _authRepo.forgotPassword(event.username);
    emit(ResetPasswordState(username: event.username));
  }

  Future<void> _onResetPasswordVerification(event, emit) async {
    emit(LoadingState());
    AuthResponse _response = await _authRepo.resetPasswordVerification(
      username: event.username,
      password: event.password,
      verificationCode: event.verificationCode,
    );
    emit(UnauthenticatedState(error: _response.error));
  }

  Future<void> _onClearUsers(event, emit) async {
    emit(LoadingState());
    AuthDebugger _debugger = await _authRepo.clearUsersData();
    print(_debugger.message);
    emit(UnauthenticatedState(error: _debugger.error));
  }
}
