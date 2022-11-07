part of 'confirmation_bloc.dart';

class ConfirmationCodeState {
  final String? confirmationCode;

  const ConfirmationCodeState._({this.confirmationCode = ''});

  ConfirmationCodeState.initial(this.confirmationCode);

  static ConfirmationCodeState copyWith({String? confirmationCode}) =>
      ConfirmationCodeState._(confirmationCode: confirmationCode);
}
