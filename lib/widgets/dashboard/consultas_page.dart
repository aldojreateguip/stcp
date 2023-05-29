import 'package:flutter/material.dart';

class ConsultasPage extends StatefulWidget {
  const ConsultasPage({super.key});

  @override
  State<ConsultasPage> createState() => _ConsultasPageState();
}

class _ConsultasPageState extends State<ConsultasPage> {
  String _titulo = 'SISTEMA TRIBUTARIO DE CONSULTAS PÚBLICAS';
  String? _anioSelected;
  List<String> _anios = ['2017', '2018', '2019', '2020'];
  String? _cuotaSelected;
  List<String> _cuotas = ['01', '02', '03', '04'];
  String? _tributoSelected;
  List<String> _tributos = ['PREDIAL', 'NO PREDIAL'];
  String? _coactivoSelected;
  List<String> _coactivo = ['SI', 'NO'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bienvenido, Usuario'),
        backgroundColor: Color(0xFF0F7490),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Icon(Icons.logout),
              backgroundColor: Color(0xFF0F7490),
            ),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Text(
                        _titulo,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text('Inicio de Consulta',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF64696F)),
                          textAlign: TextAlign.center),
                    ),
                  ]),
              SizedBox(
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
          Container(padding: EdgeInsets.all(20.0), child: _crearBoton()),
    );
  }

  Widget _crearSearch() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Buscar...',
        labelText: 'Buscar',
        suffixIcon: Icon(Icons.search),
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDrop() {
    List<DropdownMenuItem<String>> lista = [];

    _anios.forEach((value) {
      lista.add(DropdownMenuItem(
        child: Text(value),
        value: value,
      ));
    });
    return lista;
  }

  Widget _crearDropdownAnio() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: EdgeInsets.only(top: 15.0),
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
          icon: Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: Text('Seleccione año'),
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

    _cuotas.forEach((value) {
      lista.add(DropdownMenuItem(
        child: Text(value),
        value: value,
      ));
    });
    return lista;
  }

  Widget _crearDropdownCuota() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: EdgeInsets.only(top: 15.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(16.0),
          icon: Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: Text('Seleccione Cuota'),
          items: getOpcionesCuotas(),
          value: _cuotaSelected,
          onChanged: (opt) {
            setState(() {
              _cuotaSelected = opt;
            });
          },
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(19.0),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesTributo() {
    List<DropdownMenuItem<String>> lista = [];

    _tributos.forEach((value) {
      lista.add(DropdownMenuItem(
        child: Text(value),
        value: value,
      ));
    });
    return lista;
  }

  Widget _crearDropdownTributo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: EdgeInsets.only(top: 15.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(16.0),
          icon: Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: Text('Seleccione Tributo'),
          items: getOpcionesTributo(),
          value: _tributoSelected,
          onChanged: (opt) {
            setState(() {
              _tributoSelected = opt;
            });
          },
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(19.0),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesCoactivo() {
    List<DropdownMenuItem<String>> lista = [];

    _coactivo.forEach((value) {
      lista.add(DropdownMenuItem(
        child: Text(value),
        value: value,
      ));
    });
    return lista;
  }

  Widget _crearDropdownCoactivo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: EdgeInsets.only(top: 15.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(16.0),
          icon: Icon(null),
          style: TextStyle(color: Colors.grey[800], fontSize: 15),
          hint: Text('Seleccione Coactivo'),
          items: getOpcionesCoactivo(),
          value: _coactivoSelected,
          onChanged: (opt) {
            setState(() {
              _coactivoSelected = opt;
            });
          },
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(19.0),
      ),
    );
  }

  Widget _crearBoton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'listaConsulta');
        },
        child: Text(
          'GENERAR CONSULTA',
          style: TextStyle(fontSize: 10),
          textScaleFactor: 2,
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Color(0xFF2D3E50),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
