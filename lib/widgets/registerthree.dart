import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/appbar.dart';
import 'package:stcp/widgets/registerfour.dart';

class Registerthree extends StatefulWidget {
  const Registerthree({Key? key}) : super(key: key);

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Registerthree> {
  final String imageUrl = 'assets/images/reg3.png';
  ValueNotifier<bool> _obscurePassword1 = ValueNotifier<bool>(true); // Variable para controlar si se muestra o no la contraseña 1
  ValueNotifier<bool> _obscurePassword2 = ValueNotifier<bool>(true); // Variable para controlar si se muestra o no la contraseña 2
  TextEditingController _passwordController1 = TextEditingController(); // Controlador del campo de texto de la contraseña 1
  TextEditingController _passwordController2 = TextEditingController(); // Controlador del campo de texto de la contraseña 2

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

  Widget _buildTextpassInput(
    String labelText,
    TextEditingController passwordController,
    ValueNotifier<bool> obscurePassword,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ValueListenableBuilder<bool>(
        valueListenable: obscurePassword,
        builder: (context, value, child) {
          return TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: labelText,
              contentPadding: EdgeInsets.zero,
              suffixIcon: IconButton(
                icon: Icon(
                  value ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF6B6B6B),
                ),
                onPressed: () {
                  obscurePassword.value = !obscurePassword.value; // Alternar el valor del ValueNotifier
                },
              ),
            ),
            obscureText: value,
            style: const TextStyle(
              fontSize: 18,
            ),
            cursorHeight: 25,
            cursorRadius: const Radius.circular(2),
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _passwordController1.dispose(); // Liberar el controlador de la contraseña 1 al finalizar
    _passwordController2.dispose(); // Liberar el controlador de la contraseña 2 al finalizar
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const Header(title: 'REGISTRO - PASO 3', background: '#FF2D3E50', height: 56),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildHeader(),
            ),
            _buildTextpassInput('Contraseña', _passwordController1, _obscurePassword1),
            _buildTextpassInput('Confirmar contraseña', _passwordController2, _obscurePassword2),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '- 8 caracteres como mínimo.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    '- Al menos un carácter en minúscula.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    '- Al menos un carácter en mayúscula.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    '- Al menos un número.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  Text(
                    '- Al menos un carácter especial.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              context.push('/registrar4');
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
