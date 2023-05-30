import 'package:flutter/material.dart';
import 'package:stcp/widgets/appbar.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const Header(
            title: 'OLVIDÉ MI CONTRASEÑA', background: '#FF2D3E50', height: 56),
        body: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Por favor, ingrese el correo electrónico utilizado en su cuenta y le enviaremos un enlace para restablecer su contraseña.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF6B6B6B),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        cursorHeight: 25,
                        cursorRadius: Radius.circular(2),
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
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción a realizar cuando se presione el botón
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
                        'ENVIAR',
                        style: TextStyle(fontSize: 10),
                        textScaleFactor: 2,
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
