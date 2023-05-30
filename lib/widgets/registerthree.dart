import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stcp/widgets/appbar.dart';
import 'package:stcp/widgets/registerfour.dart';

class Registerthree extends StatefulWidget {
  const Registerthree({super.key});
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Registerthree> {
// Índice de la opción seleccionada
  final String imageUrl = 'assets/images/reg3.png';

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
          'ELIJA UNA CONTRASEÑA',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B6B6B),
          ),
        ),
      ],
    );
  }

  Widget _buildTextpassInput(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
        ),
        obscureText: true,
        style: const TextStyle(
          fontSize: 18,
        ),
        cursorHeight: 25,
        cursorRadius: const Radius.circular(2),
        keyboardType:
            TextInputType.text, // Establecer el tipo de teclado a texto
        inputFormatters: [
          FilteringTextInputFormatter
              .singleLineFormatter // Permitir solo una línea de texto
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
        appBar: const Header(
            title: 'REGISTRO - PASO 3', background: '#FF2D3E50', height: 56),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            _buildTextpassInput('Contraseña'),
            _buildTextpassInput('Confirmar contraseña'),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                '- 8 caracteres como mínimo.\n'
                '- Al menos un carácter en minúscula.\n'
                '- Al menos un carácter en mayúscula.\n'
                '- Al menos un número.\n'
                '- Al menos un carácter especial.\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6B6B6B),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(
                      milliseconds: 500), // Ajusta la duración de la transición
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(
                        1.0, 0.0); // Inicio de la transición desde la derecha
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
                      const Registerfour(),
                ),
              );
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
