import 'package:flutter/material.dart';
import 'package:stcp/widgets/homepage.dart';
import 'package:stcp/widgets/dashboard/pagoslist_page.dart';
import 'package:stcp/widgets/dashboard/consultas_page.dart';
import 'package:stcp/widgets/dashboard/detallePago_page.dart';

Map<String, WidgetBuilder> getAplicattionsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'consultas': (BuildContext context) => ConsultasPage(),
    'listaConsulta': (BuildContext context) => PagosListPage(),
    'detallePago': (BuildContext context) => detallePagoPage(),
  };
}
