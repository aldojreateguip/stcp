import 'package:formz/formz.dart';

// Define input validation errors
enum CeluError { empty, format, min }

// Extend FormzInput and provide the input type and error type.
class Celu extends FormzInput<String, CeluError> {
  static final RegExp celRegExp = RegExp(r'^-?[0-9]+$');

  // Call super.pure to represent an unmodified form input.
  const Celu.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Celu.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CeluError.empty) return 'El campo es requerido';
    if (displayError == CeluError.format) {
      return 'Solo números';
    }
    if (displayError == CeluError.min) return 'Debe ingresar 9 digitos';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CeluError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return CeluError.empty;
    if (!celRegExp.hasMatch(value)) return CeluError.format;
    if (value.length < 9 || value.length > 9) {
      return CeluError.min;
    }

    return null;
  }
}
