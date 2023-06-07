import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:stcp/widgets/Login/providers/auth_providers.dart';
import 'package:stcp/widgets/dashboard/domain/domain.dart';
import 'package:stcp/widgets/dashboard/infraestructure/infraestructure.dart';

final deudasREpositoryProvider = Provider<DeudaRepository>((ref) {
  //TODO:check esa vaina
  // final asad = ref.watch(authProvider).user;
  final deudaRepository = DeudaRepositoryImpl(DeudaDatasourceImpl());
  return deudaRepository;
});
