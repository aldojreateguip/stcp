import 'package:stcp/widgets/Login/infraestructure/infrasestructure.dart';

import '../../domain/domain.dart';

class DeudaMapper {
  static jsonToEntity(Map<String, dynamic> json) {
    Deuda(
        id: json['codcontribuyente'],
        anio: json['anodeu'],
        cuota: json['cuota'],
        descripcion: json['nomtributo'],
        fase: json['nomfase'],
        fechaVence: json['fecvenc'],
        gastos: json['gastos'],
        insoluto: json['insoluto'],
        interes: json['interes'],
        total: json['total'],
        user: UserMapper.userJsonToEntity(json['user']));
  }
}
