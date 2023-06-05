import 'package:stcp/widgets/Login/domain/domain.dart';

import '../infrasestructure.dart';

class LoginRespositoryImpl extends LoginRepository {
  final LoginDataSource dataSource;

  LoginRespositoryImpl({LoginDataSource? dataSource})
      : dataSource = dataSource ?? LoginDataSourceImpl();

  @override
  Future<User> checkStatusLogin(String token) {
    return dataSource.checkStatusLogin(token);
  }

  @override
  Future<User> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return dataSource.register(email, password, fullName);
  }
}
