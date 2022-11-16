import 'dart:convert';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<InitializeAuth>((event, emit) async {
      emit(LoadingState());
      AuthResponse _response = await _authRepo.initializeAuthentication();
      _response.isAuthenticated
          ? emit(AuthenticatedState())
          : emit(UnauthenticatedState(error: _response.error));
    });

    on<Authenticate>((event, emit) async {
      emit(LoadingState());
      AuthResponse _response;
      if (event.isNewUser) {
        _response = await _authRepo.createUserWithEmailAndPassword(
          name: event.name!,
          email: event.email!,
          username: event.username,
          password: event.password,
        );
        print(_response.nextStep);
        _response.nextStep
            ? emit(ConfirmCredentialsState(event.username))
            : _response.isAuthenticated
                ? emit(AuthenticatedState())
                : emit(UnauthenticatedState(error: _response.error));
      } else {
        _response = await _authRepo.signInWithEmailAndPassword(
            username: event.username, password: event.password);
        _response.nextStep
            ? emit(ConfirmCredentialsState(event.username))
            : _response.isAuthenticated
                ? emit(AuthenticatedState())
                : emit(UnauthenticatedState(error: _response.error));
      }
      print(_response.logs);
    });

    on<ConfirmCredentials>(((event, emit) async {
      emit(LoadingState());
      AuthResponse _response = await _authRepo.confirmSignUp(
          username: event.username, confirmationCode: event.confirmationCode);
      _response.isAuthenticated
          ? emit(AuthenticatedState())
          : emit(UnauthenticatedState(error: 'Something went wrong!'));
    }));

    on<ResentConfirmationCode>(((event, emit) async {
      emit(LoadingState());

      AuthResponse _response =
          await _authRepo.resendConfirmationCode(event.username);
      _response.nextStep
          ? emit(ConfirmCredentialsState(event.username))
          : _response.isAuthenticated
              ? emit(AuthenticatedState())
              : emit(UnauthenticatedState(error: _response.error));
    }));

    on<Unauthenticate>(((event, emit) async {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 3));
      await _authRepo.signOut();
      emit(UnauthenticatedState());
    }));

    on<ForgetPassword>(((event, emit) async {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 3));
      await _authRepo.forgotPassword(event.username);
      emit(ResetPasswordState(username: event.username));
    }));

    on<ResetPasswordVerification>((event, emit) async {
      emit(LoadingState());
      AuthResponse _response = await _authRepo.resetPasswordVerification(
        username: event.username,
        password: event.password,
        verificationCode: event.verificationCode,
      );
      emit(UnauthenticatedState(error: _response.error));
    });

    on<ClearUsers>(((event, emit) async {
      emit(LoadingState());
      AuthDebugger _debugger = await _authRepo.clearUsersData();
      print(_debugger.message);
      emit(UnauthenticatedState(error: _debugger.error));
    }));
  }
}
