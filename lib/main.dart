import 'package:flutter/material.dart';
import 'config/config.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stcp/routes/routes.dart';

void main() async {
  await Environment.initEnvironment();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
