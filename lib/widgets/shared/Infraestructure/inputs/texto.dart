import 'package:formz/formz.dart';

// Define input validation errors
enum TextError { empty, format }

class TextInput extends FormzInput<String, TextError> {
  const TextInput.pure() : super.pure('');
  const TextInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == TextError.empty) return 'El campo es requerido';
    return null;
  }

  @override
  TextError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return TextError.empty;
    return null;
  }
}
