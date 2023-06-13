import '../../domain/domain.dart';
import '../infraestructure.dart';

class RegisterRepositoryImpl extends RegisterRepositories {
  final RegisterDataSource datasource;

  RegisterRepositoryImpl({RegisterDataSource? datasource})
      : datasource = datasource ?? RegisterDatasourceImpl();
  @override
  Future<void> step1(String name, String apellido, String email) {
    return datasource.step1(name, apellido, email);
  }

  @override
  Future<void> step2(
      String tipdoc, String ndoc, String telefono, String codContribuyente) {
    return datasource.step2(tipdoc, ndoc, telefono, codContribuyente);
  }

  @override
  Future<void> step3(String password, String confpassword) {
    return step3(password, confpassword);
  }
}
