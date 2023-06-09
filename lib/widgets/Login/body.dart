import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stcp/widgets/Login/providers/auth_providers.dart';
import 'package:stcp/widgets/Login/providers/login_form_providers.dart';

import '../register.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool isPasswordVisible = false;

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final loginForm = ref.watch(loginFormProvider);

        ref.listen(
          authProvider,
          (previous, next) {
            if (next.errorMessage.isEmpty) return;
            showSnackbar(context, next.errorMessage);
          },
        );

        const double bodyWidth = 1;
        const double textMarginTop = 20;
        const double textScaleFactor = 2;
        const double textFontSize = 10;
        const FontWeight fontType = FontWeight.bold;
        const String textLogin = 'INICIAR SESIÓN';
        const double radiusX = 200;
        const double radiusY = 30;
        const String imageUrl = 'assets/images/logo_muni.jpg';
        const Color opacityColor = Colors.black;

        final screenHeight = MediaQuery.of(context).size.height;
        final imageHeight = screenHeight * 0.45;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: FractionallySizedBox(
            widthFactor: bodyWidth,
            child: SizedBox(
              height: screenHeight,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      height: imageHeight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(radiusX, radiusY),
                          bottomLeft: Radius.elliptical(radiusX, radiusY),
                        ),
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: opacityColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.elliptical(radiusX, radiusY),
                              bottomLeft: Radius.elliptical(radiusX, radiusY),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: textMarginTop),
                    const Text(
                      textLogin,
                      textScaleFactor: textScaleFactor,
                      style: TextStyle(
                        fontSize: textFontSize,
                        fontWeight: fontType,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          contentPadding: EdgeInsets.zero,
                          errorText: loginForm.isFormPosted
                              ? loginForm.email.errorMessage
                              : null,
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
                        keyboardType: TextInputType.emailAddress,
                        onChanged:
                            ref.read(loginFormProvider.notifier).onEmailChange,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              contentPadding: EdgeInsets.zero,
                              errorText: loginForm.isFormPosted
                                  ? loginForm.password.errorMessage
                                  : null,
                              errorBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade200),
                              ),
                              focusedErrorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            obscureText: !isPasswordVisible,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            cursorHeight: 25,
                            cursorRadius: const Radius.circular(2),
                            onChanged: ref
                                .read(loginFormProvider.notifier)
                                .onPasswordChange,
                            onSubmitted: (_) => loginForm.isPosting
                                ? null
                                : ref
                                    .read(loginFormProvider.notifier)
                                    .onFormSubmit(),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                // Cambiar la visibilidad de la contraseña
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            color: const Color(0xFF6B6B6B),
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          loginForm.isPosting
                              ? null
                              : ref
                                  .read(loginFormProvider.notifier)
                                  .onFormSubmit();
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
                          'INGRESAR',
                          style: TextStyle(fontSize: 10),
                          textScaleFactor: 2,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.push('/registrar1');
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blueGrey,
                                backgroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: const BorderSide(
                                    width: 3,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Si no tienes cuenta,',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(188, 96, 125, 139),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'REGÍSTRATE AQUI',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
