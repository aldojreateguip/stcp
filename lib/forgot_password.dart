import 'package:flutter/material.dart';
import 'package:stcp/appbar.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(title: 'OLVIDÉ MI CONTRASEÑA', background: '#FF2D3E50', height: 56),
        body: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Container(
          ),
        ),
    );
  }
}

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final String message = ModalRoute.of(context)!.settings.arguments as String;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Screen'),
//       ),
//       body: Center(
//         child: Text(message),
//       ),
//     );
//   }
// }

