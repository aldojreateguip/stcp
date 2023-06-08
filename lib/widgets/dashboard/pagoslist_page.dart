import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/providers/menu_provider.dart';
import 'package:stcp/widgets/dashboard/providers/deudas_provider.dart';

class PagosListPage extends ConsumerStatefulWidget {
  const PagosListPage({super.key});

  @override
  PagosListPageState createState() => PagosListPageState();
}

class PagosListPageState extends ConsumerState {
  final _titulo = 'Bienvenido, Usuario';
  final _colorMuni = const Color(0xFF0F7490);

  @override
  Widget build(BuildContext context) {
    final deudasState = ref.watch(deudasProvider);
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
        child: ListView.builder(
          itemCount: deudasState.deudas.length,
          itemBuilder: (BuildContext context, int index) {
            final item = deudasState.deudas[index];
            return ListTile(
              title: Text('CUOTA: ${item.cuota},  TOTAL: S/. ${item.total}'),
              subtitle: Text('${item.descripcion}, ${item.anio}, ${item.fase}'
                  .toUpperCase()), //el metodo getIcon no es tan necesario, solo es un forma de llamar un icono desde un json
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.cyan[400],
              ),
              onTap: () {
                context.push('/detallePago');
              },
            );
            ;
          },
        ),
      ),
    );
  }

  Widget _lista(List<dynamic>? data) {
    // menuProvider.cargarData;
    // return FutureBuilder(
    //   // future: menuProvider.cargarData(),
    //   // initialData: [],//ya estaba comentado
    //   builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {

    //   },
    // );

    if (data!.isEmpty) {
      return const Center(
        child: Text('No se encontraron datos'),
      );
    } else {
      return ListView(
        children: _listItems(data, context),
      );
    }
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

    // ignore: avoid_function_literals_in_foreach_calls
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
          context.push('/detallePago');
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
