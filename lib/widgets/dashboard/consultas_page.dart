import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/Login/providers/auth_providers.dart';
import 'infraestructure/infraestructure.dart';

class ConsultasPage extends ConsumerStatefulWidget {
  const ConsultasPage({super.key});

  @override
  ConsultasPageState createState() => ConsultasPageState();
}

class ConsultasPageState extends ConsumerState<ConsultasPage> {
  final String _titulo = 'SISTEMA TRIBUTARIO DE CONSULTAS PÚBLICAS';
  String? anioSelected = '';

  String? cuotaSelected = '';
  final List<String> _cuotas = [
    '001',
    '002',
    '003',
    '004',
    '005',
    '006',
    '007',
    '008',
    '009',
    '010',
    '011',
    '012'
  ];
  String? tributoSelected = '';

  String? coactivoSelected = '';
  final List<String> _coactivo = ['SI', 'NO'];
  String codContribuyente = '';
  @override
  Widget build(BuildContext context) {
    final filtros = ref.watch(authProvider).user;
    codContribuyente = filtros!.id;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Bienvenido, Usuario'),
        backgroundColor: const Color(0xFF0F7490),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              icon: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Text(
                        _titulo,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: const Text('Inicio de Consulta',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF64696F)),
                          textAlign: TextAlign.center),
                    ),
                  ]),
              const SizedBox(
                height: 25.0,
              ),
              // _crearSearch(),

              _crearDropdownAnio(filtros.years),
              _crearDropdownCuota(),
              _crearDropdownTributo(filtros.tributes),
              _crearDropdownCoactivo(),
            ],
          )),
      bottomNavigationBar:
          Container(padding: const EdgeInsets.all(20.0), child: _crearBoton()),
    );
  }

  Widget _crearSearch() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Buscar...',
        labelText: 'Buscar',
        suffixIcon: const Icon(Icons.search),
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDrop(List list) {
    List<DropdownMenuItem<String>> lista = [
      const DropdownMenuItem(value: '', child: Text('Seleecione año'))
    ];

    // ignore: avoid_function_literals_in_foreach_calls
    list.forEach((value) {
      lista.add(DropdownMenuItem(
        value: value,
        child: Text(value),
      ));
    });
    return lista;
  }

  Widget _crearDropdownAnio(anio) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(19.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(16.0),
          icon: const Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: const Text('Seleccione año'),
          items: getOpcionesDrop(anio),
          value: anioSelected,
          onChanged: (opt) {
            setState(() {
              anioSelected = opt;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesCuotas() {
    List<DropdownMenuItem<String>> lista = [
      const DropdownMenuItem(value: '', child: Text('Seleecione Cuota'))
    ];

    // ignore: avoid_function_literals_in_foreach_calls
    _cuotas.forEach((value) {
      lista.add(DropdownMenuItem(
        value: value,
        child: Text(value),
      ));
    });
    return lista;
  }

  Widget _crearDropdownCuota() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(19.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(16.0),
          icon: const Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: const Text('Seleccione Cuota'),
          items: getOpcionesCuotas(),
          value: cuotaSelected,
          onChanged: (opt) {
            setState(() {
              cuotaSelected = opt;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesTributo(List trib) {
    List<DropdownMenuItem<String>> lista = [
      const DropdownMenuItem(value: '', child: Text('Seleecione Tributo'))
    ];

    // ignore: avoid_function_literals_in_foreach_calls
    trib.forEach((value) {
      lista.add(DropdownMenuItem(
        value: value,
        child: Text(value),
      ));
    });
    return lista;
  }

  Widget _crearDropdownTributo(tribute) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(19.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(16.0),
          icon: const Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: const Text('Seleccione Tributo'),
          items: getOpcionesTributo(tribute),
          value: tributoSelected,
          onChanged: (opt) {
            setState(() {
              tributoSelected = opt;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesCoactivo() {
    List<DropdownMenuItem<String>> lista = [
      const DropdownMenuItem(value: '', child: Text('Seleecione Coactivo'))
    ];

    // ignore: avoid_function_literals_in_foreach_calls
    _coactivo.forEach((value) {
      lista.add(DropdownMenuItem(
        value: value,
        child: Text(value),
      ));
    });
    return lista;
  }

  Widget _crearDropdownCoactivo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(19.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(16.0),
          icon: const Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: const Text('Seleccione Coactivo'),
          items: getOpcionesCoactivo(),
          value: coactivoSelected,
          onChanged: (opt) {
            setState(() {
              coactivoSelected = opt;
            });
          },
        ),
      ),
    );
  }

  Widget _crearBoton() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          DeudaDatasourceImpl().getDeudasByPage(codContribuyente, anioSelected,
              cuotaSelected, tributoSelected, coactivoSelected);

          context.push('/listaConsulta');
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: const Color(0xFF2D3E50),
          foregroundColor: Colors.white,
        ),
        child: const Text(
          'GENERAR CONSULTA',
          style: TextStyle(fontSize: 10),
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
