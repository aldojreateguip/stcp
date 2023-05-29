import 'package:flutter/material.dart';

import 'package:stcp/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getAplicattionsRoutes(),
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => AlertPage());
      // },
      initialRoute: '/',
    );
  }
}
