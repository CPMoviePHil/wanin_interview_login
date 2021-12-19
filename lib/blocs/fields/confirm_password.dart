import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError {
  empty,
  mismatch,
}

class ConfirmPassword extends FormzInput<String, ConfirmedPasswordValidationError> {
  final String newConfirmPassword;
  const ConfirmPassword.pure({this.newConfirmPassword = ''}) : super.pure('');
  const ConfirmPassword.dirty({required this.newConfirmPassword, String value = ''}) : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmedPasswordValidationError.empty;
    }
    if (newConfirmPassword != value) {
      return ConfirmedPasswordValidationError.mismatch;
    }
  }
}