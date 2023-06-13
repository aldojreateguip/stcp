import 'package:dio/dio.dart';
import 'package:stcp/config/config.dart';

import '../../domain/domain.dart';
import '../infraestructure.dart';

class RegisterDatasourceImpl extends RegisterDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));
  @override
  Future<void> step1(String name, String apellido, String email) async {
    try {
      final response = await dio.post('/step1',
          data: {'first_name': name, 'last_name': apellido, 'email': email});
      print(response);
      // final user = UserMapper.userJsonToEntity(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError('Error: Este correo ya se registró');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError('Error de conexión');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> step2(String tipdoc, String ndoc, String telefono,
      String codContribuyente) async {
    try {
      final response = await dio.post('/step2', data: {
        'tip_doc': tipdoc,
        'num_doc': ndoc,
        'phone': telefono,
        'CodContribuyente': codContribuyente
      });
      print(response);
      // final user = UserMapper.userJsonToEntity(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            'Error: DNI o RUC no coiciden con el código del contribuyente');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError('Error de conexión');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> step3(String password, String confpassword) async {
    try {
      final response = await dio
          .post('/step3', data: {'password': password, 'phone': confpassword});
      print(response);
      // final user = UserMapper.userJsonToEntity(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError('Error: Las contraseñas no coinciden');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError('Error de conexión');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
