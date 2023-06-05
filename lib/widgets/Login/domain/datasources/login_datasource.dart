import '../entities/user.dart';

abstract class LoginDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String fullName);
  Future<User> checkStatusLogin(String token);
}
