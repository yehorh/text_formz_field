import 'package:formz/formz.dart';

/// Validation errors for the [field] [FormzInput].
enum FieldValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template field}
/// Form input for an field input.
/// {@endtemplate}
class Field extends FormzInput<String, FieldValidationError> {
  /// {@macro field}
  const Field.pure([super.value = '']) : super.pure();

  /// {@macro field}
  const Field.dirty(super.value) : super.dirty();

  @override
  FieldValidationError? validator(String? value) {
    if (value == null) {
      return FieldValidationError.invalid;
    }
    return null;
  }
}
