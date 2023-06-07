import 'package:dio/dio.dart';
import 'package:stcp/config/config.dart';

import '../../domain/domain.dart';
import '../mappers/deuda_mapper.dart';

class DeudaDatasourceImpl extends DeudaDatasource {
  late final Dio dio;

  DeudaDatasourceImpl() : dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<Deuda> createUpdateDeuda(Map<String, dynamic> deudaLike) {
    // TODO: implement createUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Deuda> getDeudaById(String id) {
    // TODO: implement getDeudaById
    throw UnimplementedError();
  }

  @override
  Future<List<Deuda>> getDeudasByPage(String contribuyente, String? year,
      String? cuota, String? tributo, String? coactivo) async {
    final response = await dio.post<List>('/consultas', data: {
      'contribuyente': contribuyente,
      'year': year,
      'cuota': cuota,
      'tributo': tributo,
      'coactivo': coactivo
    });
    final List<Deuda> deudas = [];
    for (final deuda in response.data ?? []) {
      deudas.add(DeudaMapper.jsonToEntity(deuda));
    }
    return deudas;
  }

  @override
  Future<List<Deuda>> searchProductByTerm(String term) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }
}
