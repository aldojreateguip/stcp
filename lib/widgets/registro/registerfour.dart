import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/appbar.dart';

import '../homepage.dart';

class Registerfour extends StatefulWidget {
  const Registerfour({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Registerfour> {
// Índice de la opción seleccionada
  final String imageUrl = 'assets/images/reg4.png';

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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: const [
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
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              context.push('/');
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
              'FINALIZAR',
              style: TextStyle(fontSize: 10),
              textScaleFactor: 2,
            ),
          ),
        ),
      ),
    );
  }
}
