import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationCodeState> {
  ConfirmationBloc() : super(ConfirmationCodeState.initial('')) {
    on<ChangeConfirmationCode>((event, emit) {
      emit(ConfirmationCodeState.copyWith(confirmationCode: event.confirmationCode));
    });
  }
}
