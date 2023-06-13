import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/appbar.dart';
import 'package:stcp/widgets/registro/registerthree.dart';

class Registertwo extends StatefulWidget {
  const Registertwo({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Registertwo> {
  int _selectedIndex = 1; // Índice de la opción seleccionada
  TextEditingController _documentNumberController = TextEditingController();

  final String imageUrl = 'assets/images/reg1.png';
  void _clearDocumentNumber() {
    setState(() {
      _documentNumberController.text = ''; // Limpiar el número de documento
      FocusScope.of(context).unfocus();
    });
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: MediaQuery.of(context).size.height *
              0.12, // Altura del 20% de la pantalla
          child: Image.asset(imageUrl),
        ),
        const Text(
          'IDENTIDAD',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B6B6B),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30), // Margen inferior de 50
        ),
      ],
    );
  }

  Widget _buildDocumentTypeSelector() {
    return Row(
      children: [
        const Text(
          'Tipo de Documento',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF6B6B6B),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: MediaQuery.of(context).size.width *
              0.42, // 40% del ancho disponible
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.25),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
            border: Border.all(
              color: const Color.fromRGBO(235, 235, 235, 1),
              width: 5,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex =
                          1; // Cambio a 1 para DNI // TODO: Actualizar índice para DNI
                      _clearDocumentNumber();
                    });
                  }, // Cambio a 1 para DNI // TODO: Actualizar índice para DNI
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: _selectedIndex ==
                              1 // Cambio a 1 para DNI // TODO: Actualizar índice para DNI
                          ? const LinearGradient(
                              colors: [Color(0xFF1A8CAB), Color(0xFF0F7490)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                          : null,
                      boxShadow: _selectedIndex ==
                              1 // Cambio a 1 para DNI // TODO: Actualizar índice para DNI
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.20),
                                offset: const Offset(0, 4),
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
                          color: _selectedIndex ==
                                  1 // Cambio a 1 para DNI // TODO: Actualizar índice para DNI
                              ? Colors.white
                              : const Color.fromARGB(115, 103, 103, 103),
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
                      _selectedIndex =
                          2; // Cambio a 2 para RUC // TODO: Actualizar índice para RUC
                      _clearDocumentNumber();
                    });
                  }, // Cambio a 2 para RUC // TODO: Actualizar índice para RUC
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: _selectedIndex ==
                              2 // Cambio a 2 para RUC // TODO: Actualizar índice para RUC
                          ? const LinearGradient(
                              colors: [Color(0xFF1A8CAB), Color(0xFF0F7490)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                          : null,
                      boxShadow: _selectedIndex ==
                              2 // Cambio a 2 para RUC // TODO: Actualizar índice para RUC
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.20),
                                offset: const Offset(0, 4),
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
                          color: _selectedIndex ==
                                  2 // Cambio a 2 para RUC // TODO: Actualizar índice para RUC
                              ? Colors.white
                              : const Color.fromARGB(115, 103, 103, 103),
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
    );
  }

  Widget _buildNumberDoc(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        controller: _documentNumberController,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
        cursorHeight: 25,
        cursorRadius: const Radius.circular(2),
        keyboardType:
            TextInputType.number, // Establecer el tipo de teclado a numérico
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          setState(() {
            // Actualizar el valor del número de documento
          });
        },
      ),
    );
  }

  Widget _buildNumberCel(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
        cursorHeight: 25,
        cursorRadius: const Radius.circular(2),
        keyboardType:
            TextInputType.number, // Establecer el tipo de teclado a numérico
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

  Widget _buildNumberCode(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
        cursorHeight: 25,
        cursorRadius: const Radius.circular(2),
        keyboardType:
            TextInputType.number, // Establecer el tipo de teclado a numérico
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const Header(
            title: 'REGISTRO - PASO 2', background: '#FF2D3E50', height: 56),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            _buildDocumentTypeSelector(),
            _buildNumberDoc('Número de Documento'),
            _buildNumberCel('Celular'),
            _buildNumberCode('Código de Contribuyente*'),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              context.push('/registrar3');
              print(_selectedIndex.toString());
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF2D3E50),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'CONTINUAR',
              style: TextStyle(fontSize: 10),
              textScaleFactor: 2,
            ),
          ),
        ),
      ),
    );
  }
}
