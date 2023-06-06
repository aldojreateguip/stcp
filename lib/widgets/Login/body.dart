import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stcp/widgets/Login/providers/auth_providers.dart';
import 'package:stcp/widgets/Login/providers/login_form_providers.dart';

import '../forgot_password.dart';
import '../register.dart';

class LoginBody extends ConsumerWidget {
  const LoginBody({super.key});
  void showSanckbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);
    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSanckbar(context, next.errorMessage);
    });

    const double bodyWidth = 1,
        textMarginTop = 20,
        textScaleFactor = 2,
        textFontSize = 10;
    const FontWeight fontType = FontWeight.bold;
    const String textLogin = 'INICIAR SESIÓN';
    const double radiusX = 200, radiusY = 30;
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
                    color: Colors.blueGrey,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    cursorHeight: 25,
                    cursorRadius: const Radius.circular(2),
                    onChanged:
                        ref.read(loginFormProvider.notifier).onEmailChange,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      contentPadding: EdgeInsets.zero,
                      errorText: loginForm.isFormPosted
                          ? loginForm.password.errorMessage
                          : null,
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade200)),
                      focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    cursorHeight: 25,
                    cursorRadius: const Radius.circular(2),
                    onChanged:
                        ref.read(loginFormProvider.notifier).onPasswordChange,
                    onSubmitted: (_) =>
                        ref.read(loginFormProvider.notifier).onFormSubmit(),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(loginFormProvider.notifier).onFormSubmit();
                      // Acción a realizar cuando se presione el botón
                      // Navigator.pushNamed(context, 'consultas');
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
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                      milliseconds:
                                          250), // Ajusta la duración de la transición
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(0.0,
                                        0.1); // Inicio de la transición desde la derecha
                                    var end = Offset
                                        .zero; // Fin de la transición en la posición actual
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(
                                            curve: Curves.easeInOut));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return FadeTransition(
                                      opacity:
                                          animation, // Aplica el efecto de desvanecimiento
                                      child: SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Register(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blueGrey,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                  width: 3,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            child: const Text(
                              'REGÍSTRATE',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                      milliseconds:
                                          250), // Ajusta la duración de la transición
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(0.0,
                                        0.1); // Inicio de la transición desde la derecha
                                    var end = Offset
                                        .zero; // Fin de la transición en la posición actual
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(
                                            curve: Curves.easeInOut));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return FadeTransition(
                                      opacity:
                                          animation, // Aplica el efecto de desvanecimiento
                                      child: SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const ForgotPassword(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blueGrey,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                  width: 3,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            child: const Text(
                              'RECUPERAR CLAVE',
                              style: TextStyle(fontSize: 13),
                            ),
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
  }
}
