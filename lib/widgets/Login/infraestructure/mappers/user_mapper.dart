import 'package:stcp/widgets/Login/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      id: json['contribuyente']['id_contribuyente'],
      nombre: json['contribuyente']['name'],
      years: List<String>.from(json['contribuyente']['year']),
      tributes: List<String>.from(json['contribuyente']['tributes']),
      token: json['access_token'] ?? '',
      refreshtoken: json['refresh_token'] ?? '');
}
