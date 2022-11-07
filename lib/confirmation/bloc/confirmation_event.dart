part of 'confirmation_bloc.dart';

@immutable
abstract class ConfirmationEvent {}

class ChangeConfirmationCode extends ConfirmationEvent {
  final String confirmationCode;

  ChangeConfirmationCode(this.confirmationCode);
}
