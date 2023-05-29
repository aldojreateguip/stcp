import 'package:flutter/material.dart';

class detallePagoPage extends StatefulWidget {
  const detallePagoPage({super.key});

  @override
  State<detallePagoPage> createState() => _detallePagoPAgeState();
}

class _detallePagoPAgeState extends State<detallePagoPage> {
  final _cuota = '01';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Pago'),
        backgroundColor: Color(0xFF0F7490),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Text('CUOTA N° $_cuota',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64696F)),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'AÑO: ${myList[0].anio.toString().toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'DESCRIPCIÓN: ${myList[0].descripcion.toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'FASE: ${myList[0].fase.toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'FECHA DE VENCIMIENTO: ${myList[0].fechaVence.toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'INSOLUTO: ${myList[0].insoluto.toStringAsFixed(2).toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'INTERÉS: ${myList[0].interes.toStringAsFixed(2).toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'GASTOS: ${myList[0].gastos.toStringAsFixed(2).toUpperCase()}',
                  style: design(),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
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

  // Widget _datosPago() {
  //   return Container(
  //     width: double.infinity,
  //     alignment: Alignment.topLeft,
  //     margin: EdgeInsets.only(top: 10.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'AÑO: ${myList[0].anio.toString().toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //         SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           'DESCRIPCIÓN: ${myList[0].descripcion.toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //         SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           'FASE: ${myList[0].fase.toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //         SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           'FECHA DE VENCIMIENTO: ${myList[0].fechaVence.toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //         SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           'INSOLUTO: ${myList[0].insoluto.toStringAsFixed(2).toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //         SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           'INTERÉS: ${myList[0].interes.toStringAsFixed(2).toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //         SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           'GASTOS: ${myList[0].gastos.toStringAsFixed(2).toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //         SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           'TOTAL: ${myList[0].total.toStringAsFixed(2).toUpperCase()}',
  //           style: design(),
  //           textAlign: TextAlign.left,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _crearBoton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Dialog(
            child: Text('Segurito?'),
          );
        },
        child: Text(
          'PAGAR',
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

  design() {
    return const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xFF64696F));
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
