// import 'package:stcp/widgets/Login/infraestructure/infrasestructure.dart';

import '../../domain/domain.dart';

class DeudaMapper {
  static jsonToEntity(Map<String, dynamic> json) => Deuda(
        idDeuda: json['clavedeu'],
        anio: json['anodeu'],
        cuota: json['cuota'],
        descripcion: json['nomtributo'],
        fase: json['nomfase'],
        fechaVence: json['fecvenc'],
        insoluto: json['insoluto'],
        interes: json['interes'],
        gastos: json['gastos'],
        total: json['total'],
      );
}

//user: UserMapper.userJsonToEntity(json['user'])
