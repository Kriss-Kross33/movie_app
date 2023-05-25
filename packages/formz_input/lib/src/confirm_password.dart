import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError {
  invalid,
}

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  final String password;
  const ConfirmPassword.pure({this.password = ''}) : super.pure('');
  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    return this.password == value
        ? null
        : ConfirmPasswordValidationError.invalid;
  }
}
