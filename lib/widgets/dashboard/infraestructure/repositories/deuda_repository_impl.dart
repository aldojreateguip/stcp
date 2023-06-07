import '../../domain/domain.dart';

class DeudaRepositoryImpl extends DeudaRepository {
  final DeudaDatasource datasource;

  DeudaRepositoryImpl(this.datasource);
  @override
  Future<Deuda> createUpdateDeuda(Map<String, dynamic> deudaLike) {
    return datasource.createUpdateDeuda(deudaLike);
  }

  @override
  Future<Deuda> getDeudaById(String id) {
    return datasource.getDeudaById(id);
  }

  @override
  Future<List<Deuda>> getDeudasByPage(String contribuyente, String? year,
      String? cuota, String? tributo, String? coactivo) {
    return datasource.getDeudasByPage(
        contribuyente, year, cuota, tributo, coactivo);
  }

  @override
  Future<List<Deuda>> searchProductByTerm(String term) {
    return datasource.searchProductByTerm(term);
  }
}
