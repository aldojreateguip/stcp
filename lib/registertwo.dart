import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stcp/appbar.dart';
import 'package:stcp/registerthree.dart';

class Registertwo extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Registertwo> {
  int _selectedIndex = 0; // Índice de la opción seleccionada
  final String imageUrl = 'assets/images/reg2.png';

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.12, // Altura del 20% de la pantalla
          child: Image.asset(imageUrl),
        ),
        Text(
          'DATOS PERSONALES',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B6B6B),
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

  Widget _buildTextInput(String labelText) {
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
        keyboardType: TextInputType.text, // Establecer el tipo de teclado a texto
        inputFormatters: [
          FilteringTextInputFormatter.singleLineFormatter // Permitir solo una línea de texto
        ],
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
        appBar: const Header(title: 'REGISTRO - PASO 2', background: '#FF2D3E50', height: 56),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            _buildTextInput('Nombres Completos'),
            _buildTextInput('Apellidos'),
            _buildNumberInput('Celular'),
            _buildTextInput('Correo electrónico'),
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
                  pageBuilder: (context, animation, secondaryAnimation) => Registerthree(),
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