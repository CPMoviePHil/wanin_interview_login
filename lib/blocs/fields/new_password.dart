import 'package:formz/formz.dart';

enum NewPasswordValidationError {
  empty,
  invalid,
}

class NewPassword extends FormzInput<String, NewPasswordValidationError> {
  const NewPassword.pure() : super.pure('');
  const NewPassword.dirty([String value = '']) : super.dirty(value);

  @override
  NewPasswordValidationError? validator(String? value) {
    if (value?.isNotEmpty != true)
      return NewPasswordValidationError.empty;
    if (value != null) {
      if (value.length > 12 || value.length < 6) {
        return NewPasswordValidationError.invalid;
      }
    }
  }
}
