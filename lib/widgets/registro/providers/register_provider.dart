import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stcp/widgets/registro/domain/domain.dart';

import '../infraestructure/infraestructure.dart';

final registerStepProvider =
    StateNotifierProvider<StepNotifier, StepState>((ref) {
  final registerRepository = RegisterRepositoryImpl();
  return StepNotifier(registerRepository: registerRepository);
});

class StepNotifier extends StateNotifier<StepState> {
  final RegisterRepositories registerRepository;
  StepNotifier({required this.registerRepository}) : super(StepState());

  Future<void> regisStep1(String name, String lastname, String email) async {
    state = state.copyWith(
      stepStatus: StepStatus.checking,
    );
    try {
      final step1 = await registerRepository.step1(name, lastname, email);
      _setValidStep();
    } on CustomError catch (e) {
      badStep(e.message);
    } catch (e) {
      badStep('Error no controlado');
    }
  }

  Future<void> regisStep2(String tipdoc, String numdoc, String celu,
      String codeContribuyente) async {
    state = state.copyWith(
      stepStatus: StepStatus.checking,
    );
    try {
      final step2 = await registerRepository.step2(
          tipdoc, numdoc, celu, codeContribuyente);
      _setValidStep();
    } on CustomError catch (e) {
      badStep(e.message);
    } catch (e) {
      badStep('Error no controlado');
    }
  }

  Future<void> regisLastStep(String password, String passwordconf) async {}

  void _setValidStep() {
    state = state.copyWith(
      stepStatus: StepStatus.correct,
    );
  }

  Future<void> badStep([String? errorMessage]) async {
    state = state.copyWith(
      stepStatus: StepStatus.bad,
      errorMessage: errorMessage,
    );
  }
}

enum StepStatus { checking, correct, bad }

class StepState {
  final StepStatus stepStatus;
  final String errorMessage;

  StepState({this.stepStatus = StepStatus.checking, this.errorMessage = ''});

  StepState copyWith({
    StepStatus? stepStatus,
    String? errorMessage,
  }) =>
      StepState(
          stepStatus: stepStatus ?? this.stepStatus,
          errorMessage: errorMessage ?? this.errorMessage);
}
