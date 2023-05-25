import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stcp/appbar.dart';
import 'package:stcp/registertwo.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _selectedIndex = 0; // Índice de la opción seleccionada
  final String imageUrl = 'assets/images/reg1.png';

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.12, // Altura del 20% de la pantalla
          child: Image.asset(imageUrl),
        ),
        Text(
          'IDENTIDAD',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B6B6B),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30), // Margen inferior de 50
        ),
      ],
    );
  }

  Widget _buildDocumentTypeSelector() {
    return Row(
      children: [
        Text(
          'Tipo de Documento',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF6B6B6B),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.42, // 40% del ancho disponible
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.25),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
            border: Border.all(
              color: Color.fromRGBO(235, 235, 235, 1),
              width: 5,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedIndex = 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
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
                  onTap: () => setState(() => _selectedIndex = 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
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
    );
  }

  Widget _buildNumberInput(String labelText) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const Header(title: 'REGISTRO - PASO 1', background: '#FF2D3E50', height: 56),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            _buildDocumentTypeSelector(),
            _buildNumberInput('Número de Documento'),
            _buildNumberInput('Código de Contribuyente*'),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500), // Ajusta la duración de la transición
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    var begin = Offset(1.0, 0.0); // Inicio de la transición desde la derecha
                    var end = Offset.zero; // Fin de la transición en la posición actual
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
                    var offsetAnimation = animation.drive(tween);

                    return FadeTransition(
                      opacity: animation, // Aplica el efecto de desvanecimiento
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) => Registertwo(),
                ),
              );
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
    );
  }
}