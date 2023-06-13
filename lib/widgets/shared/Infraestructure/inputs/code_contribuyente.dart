import 'package:formz/formz.dart';

// Define input validation errors
enum CodigoError { empty, format }

// Extend FormzInput and provide the input type and error type.
class CodeContri extends FormzInput<String, CodigoError> {
  static final RegExp dniRegExp = RegExp(r'^-?[0-9]+$');

  // Call super.pure to represent an unmodified form input.
  const CodeContri.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const CodeContri.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CodigoError.empty) return 'El campo es requerido';
    if (displayError == CodigoError.format) {
      return 'Solo números';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CodigoError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return CodigoError.empty;
    if (!dniRegExp.hasMatch(value)) return CodigoError.format;

    return null;
  }
}
