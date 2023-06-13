import 'package:formz/formz.dart';

// Define input validation errors
enum RucError { empty, format, min }

// Extend FormzInput and provide the input type and error type.
class Ruc extends FormzInput<String, RucError> {
  static final RegExp rucRegExp = RegExp(r'^-?[0-9]+$');

  // Call super.pure to represent an unmodified form input.
  const Ruc.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Ruc.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == RucError.empty) return 'El campo es requerido';
    if (displayError == RucError.format) {
      return 'Solo números';
    }
    if (displayError == RucError.min) return 'Debe ingresar 11 digitos';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  RucError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return RucError.empty;
    if (!rucRegExp.hasMatch(value)) return RucError.format;
    if (value.length < 11 || value.length > 11) {
      return RucError.min;
    }

    return null;
  }
}
