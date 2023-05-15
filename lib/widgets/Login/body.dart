import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    const double bodyWidth = 1,
        bodyHeight = 300,
        textMarginTop = 20,
        textScaleFactor = 2,
        textFontSize = 12;
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
            child: const Text(
              textLogin,
              textScaleFactor: textScaleFactor,
              style: TextStyle(fontSize: textFontSize, fontWeight: fontType),
            ),
          ),
        ),
      ),
    );
  }
}
