import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:stcp/widgets/dashboard/domain/domain.dart';

import 'deudas_repository_provider.dart';
//TODO:QUIZA ES MEJOR Q AQUI SE CARGUE EL USER ID
// import '../../Login/providers/auth_providers.dart';

final deudasProvider =
    StateNotifierProvider<DeudasNotifier, DeudasState>((ref) {
  final deudaRepository = ref.watch(deudasRepositoryProvider);
  return DeudasNotifier(deudasRepository: deudaRepository);
});

class DeudasNotifier extends StateNotifier<DeudasState> {
  final DeudaRepository deudasRepository;
  DeudasNotifier({required this.deudasRepository}) : super(DeudasState()) {}

  Future loadDeudasPage(String contribuyente, String year, String cuota,
      String tributo, String coactivo) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, deudas: []);
    final deudas = await deudasRepository.getDeudasByPage(
        contribuyente, year, cuota, tributo, coactivo);
    if (deudas.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }
    state = state.copyWith(isLoading: false, deudas: deudas);
  }
}

class DeudasState {
  final bool isLoading;
  final List<Deuda> deudas;

  DeudasState({this.isLoading = false, this.deudas = const []});

  DeudasState copyWith({
    bool? isLoading,
    List<Deuda>? deudas,
  }) =>
      DeudasState(
        isLoading: isLoading ?? this.isLoading,
        deudas: deudas ?? this.deudas,
      );
}
