import 'package:flutter/material.dart';

class ConsultasPage extends StatefulWidget {
  const ConsultasPage({super.key});

  @override
  State<ConsultasPage> createState() => _ConsultasPageState();
}

class _ConsultasPageState extends State<ConsultasPage> {
  final String _titulo = 'SISTEMA TRIBUTARIO DE CONSULTAS PÚBLICAS';
  String? _anioSelected;
  final List<String> _anios = ['2017', '2018', '2019', '2020'];
  String? _cuotaSelected;
  final List<String> _cuotas = ['01', '02', '03', '04'];
  String? _tributoSelected;
  final List<String> _tributos = ['PREDIAL', 'NO PREDIAL'];
  String? _coactivoSelected;
  final List<String> _coactivo = ['SI', 'NO'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Bienvenido, Usuario'),
        backgroundColor: const Color(0xFF0F7490),
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
              _crearSearch(),
              _crearDropdownAnio(),
              _crearDropdownCuota(),
              _crearDropdownTributo(),
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

  List<DropdownMenuItem<String>> getOpcionesDrop() {
    List<DropdownMenuItem<String>> lista = [];

    // ignore: avoid_function_literals_in_foreach_calls
    _anios.forEach((value) {
      lista.add(DropdownMenuItem(
        value: value,
        child: Text(value),
      ));
    });
    return lista;
  }

  Widget _crearDropdownAnio() {
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
          items: getOpcionesDrop(),
          value: _anioSelected,
          onChanged: (opt) {
            setState(() {
              _anioSelected = opt;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesCuotas() {
    List<DropdownMenuItem<String>> lista = [];

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
          hint: const Text('Seleccione Cuota'),
          items: getOpcionesCuotas(),
          value: _cuotaSelected,
          onChanged: (opt) {
            setState(() {
              _cuotaSelected = opt;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesTributo() {
    List<DropdownMenuItem<String>> lista = [];

    // ignore: avoid_function_literals_in_foreach_calls
    _tributos.forEach((value) {
      lista.add(DropdownMenuItem(
        value: value,
        child: Text(value),
      ));
    });
    return lista;
  }

  Widget _crearDropdownTributo() {
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
          hint: const Text('Seleccione Tributo'),
          items: getOpcionesTributo(),
          value: _tributoSelected,
          onChanged: (opt) {
            setState(() {
              _tributoSelected = opt;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesCoactivo() {
    List<DropdownMenuItem<String>> lista = [];

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
          hint: const Text('Seleccione Coactivo'),
          items: getOpcionesCoactivo(),
          value: _coactivoSelected,
          onChanged: (opt) {
            setState(() {
              _coactivoSelected = opt;
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
          Navigator.pushNamed(context, 'listaConsulta');
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
