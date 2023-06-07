import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:stcp/widgets/dashboard/domain/domain.dart';

import '../../Login/providers/auth_providers.dart';

class DeudasNotifier extends StateNotifier<DeudasState> {
  final DeudaRepository deudasRepository;
  DeudasNotifier({required this.deudasRepository}) : super(DeudasState());
  Future loadNextPage(ref) async {
    final asad = ref.watch(authProvider).user;
    // final deudas = await deudasRepository
    // .getDeudasByPage(contribuyente:  , year, cuota, tributo, coactivo)
    // if (deudas) {

    // }
  }
}

class DeudasState {
  final bool isLastPage;
  final int limit;
  final bool isLoading;
  final List<Deuda> deudas;

  DeudasState(
      {this.isLastPage = false,
      this.limit = 10,
      this.isLoading = false,
      this.deudas = const []});
}

// DeudasState copyWith({
//   bool? isLastPage,
//   int? limit,
//   bool? isLoading,
//   List<Deuda>? deudas,
// }) =>
//     DeudasState(
//       isLastPage: isLastPage ?? this.isLastPage,
//       limit: limit ?? this.limit,
//       isLoading: isLoading ?? this.isLoading,
//       deudas: deudas ?? this.deudas,
//     );
