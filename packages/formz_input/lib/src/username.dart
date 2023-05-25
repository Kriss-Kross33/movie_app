import 'package:formz/formz.dart';

/// Generic input validation error
enum UsernameInputValidationError {
  /// Generic invalid error
  invalid,
}

/// {@template field}
/// Form input for Genric fields
/// {@endtemplate}
class Username extends FormzInput<String, UsernameInputValidationError> {
  /// {@macro field}
  const Username.pure() : super.pure('');

  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameInputValidationError? validator(String? value) {
    if (value == null) value = '';
    if (value.isNotEmpty && value.length > 4) return null;
    return UsernameInputValidationError.invalid;
  }
}
