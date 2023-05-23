import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:stcp/appbar.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _selectedIndex = 0; // Índice de la opción seleccionada

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const Header(title: 'REGISTRO', background: '#FF2D3E50', height: 56),
        body: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tipo de Documento',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4, // 40% del ancho disponible
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.25),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: _selectedIndex == 0
                                          ? LinearGradient(
                                              colors: [Color(0xFF1A8CAB), Color(0xFF0F7490)],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            )
                                          : null,
                                      boxShadow: _selectedIndex == 0
                                          ? [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.20),
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'DNI',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: _selectedIndex == 0 ? Colors.white : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: _selectedIndex == 1
                                          ? LinearGradient(
                                              colors: [Color(0xFF1A8CAB), Color(0xFF0F7490)],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            )
                                          : null,
                                      boxShadow: _selectedIndex == 1
                                          ? [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.20),
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'RUC',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: _selectedIndex == 1 ? Colors.white : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Número de Documento',
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        cursorHeight: 25,
                        cursorRadius: Radius.circular(2),
                        keyboardType: TextInputType.number, // Establecer el tipo de teclado a numérico
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Código de Contribuyente*',
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        cursorHeight: 25,
                        cursorRadius: Radius.circular(2),
                        keyboardType: TextInputType.number, // Establecer el tipo de teclado a numérico
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción a realizar cuando se presione el botón
                      },
                      child: Text(
                        'CONTINUAR',
                        style: TextStyle(fontSize: 10),
                        textScaleFactor: 2,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        primary: Color(0xFF2D3E50),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
