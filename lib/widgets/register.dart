import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/appbar.dart';
import 'package:stcp/widgets/registertwo.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
// Índice de la opción seleccionada
  final String imageUrl = 'assets/images/reg2.png';

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

  Widget _buildTextInput(String labelText) {
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
            TextInputType.text, // Establecer el tipo de teclado a texto
        inputFormatters: [
          FilteringTextInputFormatter
              .singleLineFormatter // Permitir solo una línea de texto
        ],
      ),
    );
  }

  Widget _buildTextInputMail(String labelText) {
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
            TextInputType.emailAddress, // Teclado para correo electrónico
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
            title: 'REGISTRO - PASO 1', background: '#FF2D3E50', height: 56),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            _buildTextInput('Nombres Completos'),
            _buildTextInput('Apellidos'),
            _buildTextInputMail('Correo electrónico'),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              context.push('/registrar2');
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
