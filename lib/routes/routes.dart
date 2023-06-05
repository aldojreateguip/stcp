import 'package:flutter/material.dart';
import 'package:stcp/widgets/homepage.dart';
import 'package:stcp/widgets/dashboard/pagoslist_page.dart';
import 'package:stcp/widgets/dashboard/consultas_page.dart';
import 'package:stcp/widgets/dashboard/detalle_pago_page.dart';

Map<String, WidgetBuilder> getAplicattionsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'consultas': (BuildContext context) => const ConsultasPage(),
    'listaConsulta': (BuildContext context) => const PagosListPage(),
    'detallePago': (BuildContext context) => const DetallePagoPage(),
  };
}
