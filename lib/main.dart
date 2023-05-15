import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stcp/widgets/Login/body.dart';
import 'package:stcp/widgets/Login/logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STCP',
      home: Scaffold(
        // backgroundColor: HexColor('#1E1E1E'),
        appBar: AppBar(
          title: const Text('Sistema Tributario de Consultas Públicas'),
          backgroundColor: HexColor('#2D3E50'),
        ),
        body: Center(
            child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoMuni(),
                const LoginBody(),
                Container(
                  color: HexColor('#FFFFFF'),
                  height: 300,
                ),
                Container(
                  color: Colors.green,
                  height: 300,
                ),
                Container(
                  color: Colors.red,
                  height: 300,
                ),
                Container(
                  color: Colors.green,
                  height: 300,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
