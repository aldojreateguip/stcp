import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:stcp/widgets/registro/providers/register_provider.dart';
import 'package:stcp/widgets/shared/Infraestructure/inputs/celu.dart';
import 'package:stcp/widgets/shared/shared.dart';

final registerFormStep1Provider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final step2CallBack = ref.watch(registerStepProvider.notifier).regisStep2;
  return RegisterFormNotifier(step2CallBack: step2CallBack);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String, String, String) step2CallBack;
  RegisterFormNotifier({required this.step2CallBack})
      : super(RegisterFormState());

  onDocTipChange(int value) {
    final int newtipdoc = value;
    state = state.copyWith(tipDoc: newtipdoc);
  }

  onNumdocChange(String value) {
    final String newValue = value;
    if (state.tipDoc == 1) {
      onDniChange(newValue);
    } else if (state.tipDoc == 2) {
      onRucChange(newValue);
    }
  }

  onDniChange(String value) {
    final newDni = Dni.dirty(value);
    state = state.copyWith(
        dni: newDni,
        isValid: Formz.validate([newDni, state.celu, state.contri]));
  }

  onRucChange(String value) {
    final newRuc = Ruc.dirty(value);
    state = state.copyWith(
        ruc: newRuc,
        isValid: Formz.validate([newRuc, state.celu, state.contri]));
  }

  onFormSubmitStep1() async {
    _touchEveryFieldStep1(state.tipDoc);
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    if (state.tipDoc == 1) {
      await step2CallBack(state.tipDoc.toString(), state.dni.value,
          state.celu.value, state.contri.value);
    } else if (state.tipDoc == 2) {
      await step2CallBack(state.tipDoc.toString(), state.ruc.value,
          state.celu.value, state.contri.value);
    }
    state = state.copyWith(isPosting: false);
  }

  _touchEveryFieldStep1(int tipoDocuValue) {
    if (tipoDocuValue == 1) {
      final dni = Dni.dirty(state.dni.value);
      final celu = Celu.dirty(state.celu.value);
      final contri = CodeContri.dirty(state.contri.value);
      ;
      state = state.copyWith(
          isFormPosted: true,
          tipDoc: tipoDocuValue,
          dni: dni,
          celu: celu,
          contri: contri,
          isValid: Formz.validate([dni, celu, contri]));
    }
    if (tipoDocuValue == 2) {
      final ruc = Ruc.dirty(state.ruc.value);
      final celu = Celu.dirty(state.celu.value);
      final contri = CodeContri.dirty(state.contri.value);
      ;
      state = state.copyWith(
          isFormPosted: true,
          tipDoc: tipoDocuValue,
          ruc: ruc,
          celu: celu,
          contri: contri,
          isValid: Formz.validate([ruc, celu, contri]));
    }
  }
}

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final int tipDoc;
  final Dni dni;
  final Ruc ruc;
  final Celu celu;
  final CodeContri contri;

  RegisterFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.tipDoc = 1,
      this.dni = const Dni.pure(),
      this.ruc = const Ruc.pure(),
      this.celu = const Celu.pure(),
      this.contri = const CodeContri.pure()});

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    int? tipDoc,
    Dni? dni,
    Ruc? ruc,
    Celu? celu,
    CodeContri? contri,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        tipDoc: tipDoc ?? this.tipDoc,
        dni: dni ?? this.dni,
        ruc: ruc ?? this.ruc,
        celu: celu ?? this.celu,
        contri: contri ?? this.contri,
      );

  @override
  String toString() {
    return '''
  RegisterFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    tipDoc: $tipDoc
    dni: $dni
    ruc: $ruc
    celu: $celu
    contri: $contri    
''';
  }
}
