import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('assets/images/list_data.json');

    Map dataMap = json.decode(resp);
    // print(dataMap['rutas']);
    opciones = dataMap['data'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();
