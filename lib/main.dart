import 'package:flutter/material.dart';
import 'package:stcp/forgot_password.dart';
import 'package:stcp/homepage.dart';
import 'package:stcp/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/forgot': (context) => ForgotPassword(),
        '/register': (context) => Register(),
      },
      initialRoute: '/',
    );
  }
}