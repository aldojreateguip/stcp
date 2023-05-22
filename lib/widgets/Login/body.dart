import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double bodyWidth = 1,
        bodyHeight = 390,
        textMarginTop = 20,
        textScaleFactor = 2,
        textFontSize = 10;
    const FontWeight fontType = FontWeight.bold;
    const String textLogin = 'INICIAR SESIÓN';

    return FractionallySizedBox(
      widthFactor: bodyWidth,
      child: SizedBox(
        height: bodyHeight,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: textMarginTop),
            child: Column(
              children: [
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción a realizar cuando se presione el botón
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
                              Navigator.pushNamed(context, '/forgot');
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
