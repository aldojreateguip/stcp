import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stcp/widgets/appbar.dart';

import 'homepage.dart';

class Registerfour extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Registerfour> {
  int _selectedIndex = 0; // Índice de la opción seleccionada
  final String imageUrl = 'assets/images/reg4.png';

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height *
              0.12, // Altura del 20% de la pantalla
          child: Image.asset(imageUrl),
        ),
        Text(
          '¡ESTAMOS CASI LISTOS!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF26C767),
          ),
        ),
      ],
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
            title: 'REGISTRO - PASO 4', background: '#FF2D3E50', height: 56),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    'Esta acción requiere una verificación de correo. Por favor, revisa tu buzón de correo y sigue las instrucciones enviadas.\n\n'
                    'El mensaje de verificación se envió al siguiente correo:\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6B6B6B),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    'aadominguezn@gmail.com',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF26C767), // Color de texto negro
                    ),
                    textAlign: TextAlign.center, // Alineación centrada
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(
                      milliseconds: 500), // Ajusta la duración de la transición
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(
                        0.0, 0.1); // Inicio de la transición desde la derecha
                    var end = Offset
                        .zero; // Fin de la transición en la posición actual
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: Curves.easeInOut));
                    var offsetAnimation = animation.drive(tween);

                    return FadeTransition(
                      opacity: animation, // Aplica el efecto de desvanecimiento
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomePage(),
                ),
              );
            },
            child: Text(
              'FINALIZAR',
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
