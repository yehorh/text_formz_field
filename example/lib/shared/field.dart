import 'package:formz/formz.dart';

enum FieldValidationError { invalid }

class Field extends FormzInput<String, FieldValidationError> {
  const Field.pure([super.value = '']) : super.pure();

  const Field.dirty(super.value) : super.dirty();

  @override
  FieldValidationError? validator(String? value) {
    if (value == null) {
      return FieldValidationError.invalid;
    }
    return null;
  }
}