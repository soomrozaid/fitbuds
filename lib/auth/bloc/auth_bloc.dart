import 'package:bloc/bloc.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    AuthenticationRepository _authRepo = AuthenticationRepository();
    on<Authenticate>((event, emit) async {
      // TODO: implement event handler
      event.isNewUser
          ? await _authRepo.signup(
                      name: event.name!,
                      email: event.email!,
                      username: event.username,
                      password: event.password)
              ? emit(AuthenticatedState())
              : emit(UnauthenticatedState())
          : await _authRepo.signin(
                      username: event.password, password: event.password)
              ? emit(AuthenticatedState())
              : emit(UnauthenticatedState());
    });

    on<Unauthenticate>(((event, emit) {
      emit(UnauthenticatedState());
    }));
  }
}
