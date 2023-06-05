import 'package:flutter/material.dart';

class DetallePagoPage extends StatefulWidget {
  const DetallePagoPage({super.key});

  @override
  State<DetallePagoPage> createState() => _DetallePagoPageState();
}

class _DetallePagoPageState extends State<DetallePagoPage> {
  final _cuota = '01';
  final _alertPagotxt = '¿Esta seguro de realizar el pago de esta cuota?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle Pago'),
        backgroundColor: const Color(0xFF0F7490),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                child: Text('CUOTA N° $_cuota',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64696F)),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'AÑO: ${myList[0].anio.toString().toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'DESCRIPCIÓN: ${myList[0].descripcion.toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'FASE: ${myList[0].fase.toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'FECHA DE VENCIMIENTO: ${myList[0].fechaVence.toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'INSOLUTO: ${myList[0].insoluto.toStringAsFixed(2).toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'INTERÉS: ${myList[0].interes.toStringAsFixed(2).toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'GASTOS: ${myList[0].gastos.toStringAsFixed(2).toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Text(
                  'TOTAL: ${myList[0].total.toStringAsFixed(2).toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
            ]),
      ),
      bottomNavigationBar:
          Container(padding: const EdgeInsets.all(20.0), child: _crearBoton()),
    );
  }

  Widget _crearBoton() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _alertPago(context);
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
          'PAGAR',
          style: TextStyle(fontSize: 10),
          textScaleFactor: 2,
        ),
      ),
    );
  }

  design() {
    return const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xFF64696F));
  }

  void _alertPago(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 10.0),
                  Text('Advertencia'),
                ]),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(_alertPagotxt),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK')),
            ],
          );
        });
  }
}

class MyData {
  final int anio;
  final String descripcion;
  final String fase;
  final String fechaVence;
  final double insoluto;
  final double interes;
  final double gastos;
  final double total;

  MyData({
    required this.anio,
    required this.descripcion,
    required this.fase,
    required this.fechaVence,
    required this.insoluto,
    required this.interes,
    required this.gastos,
    required this.total,
  });
}

List<MyData> myList = [
  MyData(
    anio: 2017,
    descripcion: 'PARQUES/JARDINES',
    fase: 'emision',
    fechaVence: '28/02/2017',
    insoluto: 4.12,
    interes: 22.95,
    gastos: 0.00,
    total: 4.12,
  ),
];
