import '../entities/deuda.dart';

abstract class DeudaDatasource {
  Future<List<Deuda>> getDeudasByPage(String contribuyente, String? year,
      String? cuota, String? tributo, String? coactivo);
  Future<Deuda> getDeudaById(String id);
  Future<List<Deuda>> searchProductByTerm(String term);
  Future<Deuda> createUpdateDeuda(Map<String, dynamic> deudaLike);
}
