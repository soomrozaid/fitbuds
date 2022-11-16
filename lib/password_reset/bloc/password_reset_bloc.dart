import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  PasswordResetBloc() : super(PasswordResetState.initial()) {
    on<ChangePasswordResetValues>((event, emit) {
      emit(state.copyWith(
          username: event.username,
          password: event.password,
          verificationCode: event.verificationCode));
    });
  }
}
