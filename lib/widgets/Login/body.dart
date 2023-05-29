import 'package:flutter/material.dart';

import '../forgot_password.dart';
import '../register.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return FractionallySizedBox(
      widthFactor: bodyWidth,
      child: SizedBox(
        height: screenHeight,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
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
                SizedBox(height: textMarginTop),
                Text(
                  textLogin,
                  textScaleFactor: textScaleFactor,
                  style: TextStyle(
                    fontSize: textFontSize,
                    fontWeight: fontType,
                    color: Colors.blueGrey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      contentPadding: EdgeInsets.zero,
                    ),
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    cursorHeight: 25,
                    cursorRadius: Radius.circular(2),
                  ),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción a realizar cuando se presione el botón
                      Navigator.pushNamed(context, 'consultas');
                    },
                    child: Text(
                      'INGRESAR',
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(
                                      milliseconds:
                                          250), // Ajusta la duración de la transición
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = Offset(0.0,
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
                                      Register(),
                                ),
                              );
                            },
                            child: Text(
                              'REGÍSTRATE',
                              style: TextStyle(fontSize: 13),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(
                                  width: 3,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              primary: Colors.white,
                              onPrimary: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(
                                      milliseconds:
                                          250), // Ajusta la duración de la transición
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = Offset(0.0,
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
                                      ForgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'FORGOT PASSWORD',
                              style: TextStyle(fontSize: 13),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(
                                  width: 3,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              primary: Colors.white,
                              onPrimary: Colors.blueGrey,
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
