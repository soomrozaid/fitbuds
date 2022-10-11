import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<Authenticate>((event, emit) async {
      SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();

      if (event.isNewUser) {

        List<String>? _users = _sharedPrefs.getStringList('users')?? <String>[];

        Map<String, String> _user = {
          'name': event.name ?? 'no name',
          'username': event.username ?? 'no username',
          'email': event.email,
          'password': event.password,
        };

        _users.add(jsonEncode(_user));

        _sharedPrefs.setStringList('users', _users);

        await _authRepo.createUserWithEmailAndPassword(
                email: event.email, password: event.password)
            ? emit(AuthenticatedState())
            : emit(UnauthenticatedState());
      } else {
        // List<String>? _users = _sharedPrefs.getString('users') as List<String>;

        // if (_users.isNotEmpty && _users.contains(event.email)) {
        await _authRepo.signInWithEmailAndPassword(
                email: event.email, password: event.password)
            ? emit(AuthenticatedState())
            : emit(UnauthenticatedState());
        // } else {
        //   emit(UnauthenticatedState(error: 'User not found!'));
        // }
      }
      // event.isNewUser
      //     ? await _authRepo.createUserWithEmailAndPassword(
      //             email: event.email, password: event.password)
      //         ? emit(AuthenticatedState())
      //         : emit(UnauthenticatedState())
      //     : await _authRepo.signInWithEmailAndPassword(
      //             email: event.password, password: event.password)
      //         ? emit(AuthenticatedState())
      //         : emit(UnauthenticatedState());
    });

    on<Unauthenticate>(((event, emit) {
      emit(UnauthenticatedState());
    }));

    on<ClearUsers>(((event, emit) async {
      SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
      _sharedPrefs.clear();
      emit(UnauthenticatedState());
    }));
  }
}
