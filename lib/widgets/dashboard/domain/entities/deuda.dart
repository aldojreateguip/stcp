import 'package:stcp/widgets/Login/domain/domain.dart';

class Deuda {
  String id;
  String anio;
  String cuota;
  String descripcion;
  String fase;
  String fechaVence;
  double insoluto;
  double interes;
  double gastos;
  double total;
  User user;

  Deuda({
    required this.id,
    required this.anio,
    required this.cuota,
    required this.descripcion,
    required this.fase,
    required this.fechaVence,
    required this.insoluto,
    required this.interes,
    required this.gastos,
    required this.total,
    required this.user,
  });
}
