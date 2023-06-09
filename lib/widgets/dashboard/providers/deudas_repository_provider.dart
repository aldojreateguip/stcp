import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:stcp/widgets/Login/providers/auth_providers.dart';
import 'package:stcp/widgets/dashboard/domain/domain.dart';
import 'package:stcp/widgets/dashboard/infraestructure/infraestructure.dart';

final deudasRepositoryProvider = Provider<DeudaRepository>((ref) {
  //TODO:check esa vaina, debido  que usamos la api sin token
  // final accessToken = ref.watch(authProvider.user).token ?? '';
  final deudaRepository = DeudaRepositoryImpl(DeudaDatasourceImpl());
  return deudaRepository;
});
