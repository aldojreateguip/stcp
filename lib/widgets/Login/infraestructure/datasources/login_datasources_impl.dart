import 'package:dio/dio.dart';
import 'package:stcp/config/config.dart';
import 'package:stcp/widgets/Login/domain/domain.dart';
import 'package:stcp/widgets/Login/infraestructure/infrasestructure.dart';

class LoginDataSourceImpl extends LoginDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));
  @override
  Future<User> checkStatusLogin(String token) {
    // TODO: implement checkStatusLogin
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post('/login', data: {
        'username': email,
        'password': password,
      });

      // final user = UserMapper.userJsonToEntity(response.data);
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } catch (e) {
      throw WrongCredentials();
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
