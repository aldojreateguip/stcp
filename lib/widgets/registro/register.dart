import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/appbar.dart';

import 'providers/provider.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends ConsumerState<Register> {
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

  Widget _buildTextNombre(String labelText) {
    final step1Prov = ref.watch(registerFormStep1Provider);
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        onChanged: ref.read(registerFormStep1Provider.notifier).onNombreChange,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
          errorText:
              step1Prov.isFormPosted ? step1Prov.nombre.errorMessage : null,
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade200),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
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

  Widget _buildTextApellido(String labelText) {
    final step1Prov = ref.watch(registerFormStep1Provider);
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        onChanged:
            ref.read(registerFormStep1Provider.notifier).onApellidoChange,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
          errorText:
              step1Prov.isFormPosted ? step1Prov.apellido.errorMessage : null,
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade200),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
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
    final step1Prov = ref.watch(registerFormStep1Provider);
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        onChanged: ref.read(registerFormStep1Provider.notifier).onEmailChange,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.zero,
          errorText:
              step1Prov.isFormPosted ? step1Prov.email.errorMessage : null,
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade200),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
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

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      registerStepProvider,
      (previous, next) {
        if (next.errorMessage.isEmpty) return;
        showSnackbar(context, next.errorMessage);
      },
    );
    final status = ref.watch(registerStepProvider.notifier);
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
            _buildTextNombre('Nombres Completos'),
            _buildTextApellido('Apellidos'),
            _buildTextInputMail('Correo electrónico'),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () async {
              ref.watch(registerFormStep1Provider).isPosting
                  ? null
                  : await ref
                      .read(registerFormStep1Provider.notifier)
                      .onFormSubmitStep1();

              if (status.state.stepStatus == StepStatus.correct) {
                context.push('/registrar2');
              }
              // context.push('/registrar2');
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
