import 'package:flutter/material.dart';
import 'package:stcp/widgets/Login/body.dart';
import 'package:stcp/forgot_password.dart';
import 'package:stcp/widgets/Login/logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogoMuni(),
                LoginBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
