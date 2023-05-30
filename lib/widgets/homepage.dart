import 'package:flutter/material.dart';
import 'package:stcp/widgets/Login/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                LoginBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
