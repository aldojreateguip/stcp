import 'package:flutter/material.dart';
import 'package:stcp/providers/menu_provider.dart';

class PagosListPage extends StatefulWidget {
  const PagosListPage({super.key});

  @override
  State<PagosListPage> createState() => _PagosListPageState();
}

class _PagosListPageState extends State<PagosListPage> {
  final _titulo = 'Bienvenido, Usuario';
  final _colorMuni = const Color(0xFF0F7490);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(_titulo),
        backgroundColor: _colorMuni,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Color(0xFF0F7490),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _lista(),
      ),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData;
    return FutureBuilder(
      future: menuProvider.cargarData(),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [
      Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                _titulo,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
      const SizedBox(
        height: 25.0,
      ),
    ];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text('CUOTA: ${opt['cuota']},  TOTAL: S/. ${opt['total']}'),
        subtitle: Text(opt['descripcion'] +
            ', ' +
            opt['anio'] +
            ', ' +
            opt['fase']
                .toUpperCase()), //el metodo getIcon no es tan necesario, solo es un forma de llamar un icono desde un json
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.cyan[400],
        ),
        onTap: () {
          Navigator.pushNamed(context, 'detallePago');
        },
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider(
          color: Colors.grey[400],
          thickness: 1,
        ));
    });
    return opciones;
  }
}
