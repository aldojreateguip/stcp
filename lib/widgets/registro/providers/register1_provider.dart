import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:stcp/widgets/registro/providers/register_provider.dart';
import 'package:stcp/widgets/shared/shared.dart';

final registerFormStep1Provider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final step1CallBack = ref.watch(registerStepProvider.notifier).regisStep1;
  return RegisterFormNotifier(step1CallBack: step1CallBack);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String, String) step1CallBack;
  RegisterFormNotifier({required this.step1CallBack})
      : super(RegisterFormState());

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate([newEmail, state.nombre, state.apellido]));
  }

  onNombreChange(String value) {
    final newNombre = TextInput.dirty(value);
    state = state.copyWith(
        nombre: newNombre,
        isValid: Formz.validate([newNombre, state.apellido, state.email]));
  }

  onApellidoChange(String value) {
    final newApellido = TextInput.dirty(value);
    state = state.copyWith(
        apellido: newApellido,
        isValid: Formz.validate([newApellido, state.nombre, state.email]));
  }

  onFormSubmitStep1() async {
    _touchEveryFieldStep1();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    await step1CallBack(
        state.nombre.value, state.apellido.value, state.email.value);
    state = state.copyWith(isPosting: false);
  }

  _touchEveryFieldStep1() {
    final nombre = TextInput.dirty(state.nombre.value);
    final apellido = TextInput.dirty(state.apellido.value);
    final email = Email.dirty(state.email.value);
    state = state.copyWith(
        isFormPosted: true,
        nombre: nombre,
        apellido: apellido,
        email: email,
        isValid: Formz.validate([nombre, apellido, email]));
  }
}

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final TextInput nombre;
  final TextInput apellido;
  final Email email;

  RegisterFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.nombre = const TextInput.pure(),
      this.apellido = const TextInput.pure(),
      this.email = const Email.pure()});

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    TextInput? nombre,
    TextInput? apellido,
    Email? email,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        email: email ?? this.email,
      );

  @override
  String toString() {
    return '''
  RegisterFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    nombre: $nombre    
    apellido: $apellido   
    email: $email    
''';
  }
}
